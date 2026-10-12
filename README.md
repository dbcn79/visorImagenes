# VisorImagenes

Aplicacion VCL (Delphi) para catalogar y visualizar imagenes asociadas a pacientes, con **FireDAC**, **SQL Server** y controles **DevExpress**.

## Seguridad y configuracion

Esta rama elimina contrasenas y claves de cifrado incrustadas en el codigo fuente actual. **Atencion**: las credenciales antiguas siguen presentes en el historial anterior de Git y el repositorio es publico. Si alguna sigue siendo valida, hay que **revocarla y rotarla**. La limpieza del historial es una operacion separada que debe planificarse para no romper clones existentes.

Crear, junto al ejecutable, un archivo local `Visorimagenes.config` (nunca subirlo al repositorio):

```ini
[SITE]
Server=SERVIDOR_SQL
BBDD=NOMBRE_BASE_DATOS
Login=USUARIO_SQL
IMG=imagenes
```

Opciones de autenticacion:

- Preferida si esta disponible: autenticacion integrada de Windows. Definir `VISORIMAGENES_DB_AUTH=windows` en el entorno del proceso.
- Autenticacion SQL: definir `VISORIMAGENES_DB_PASSWORD` en el entorno del proceso. El usuario se lee de `Login` en la configuracion local.
- **Solo para migracion**: si la configuracion anterior contiene `Password` cifrado, se puede descifrar temporalmente definiendo `VISORIMAGENES_GKC_KEY` en el entorno. Retirar el secreto cifrado del INI despues de migrar. Nunca reutilizar la clave publicada anteriormente en Git.

Los nombres de las variables son sensibles a los errores tipograficos. Ninguna de ellas se configura automaticamente desde el repositorio.

El driver FireDAC llamado `GESIMAG` y las bibliotecas de componentes Delphi/DevExpress deben estar configurados en la instalacion de desarrollo.

## Cambios principales en esta rama

- Se conserva el archivo de origen durante la importacion de imagenes; no se borra el fichero elegido por el usuario.
- Transacciones de base de datos para guardar y eliminar registros relacionados con imagenes.
- Correcciones de liberacion de objetos (`TBitmap`, `FImagen` y formularios); miniaturas sin deformacion.
- Carga de descripciones de tipos de imagen por lotes, en lugar de una consulta SQL por registro.
- Tratamiento correcto de `Null` en filtros `Variant`; consultas parametrizadas en varios puntos.
- Limpieza limitada a directorios temporales y separacion de directorios de presentacion por proceso.
- Salida anticipada cuando no es posible conectar a la base de datos.

## Comprobaciones manuales necesarias

Este proyecto requiere **Windows con RAD Studio/Delphi, DevExpress y acceso a una BD de pruebas**; la rama no se ha compilado ni probado contra datos reales.

1. Compilar `dpr/VisorImagenes.dproj` con la misma version de Delphi y componentes que el proyecto original.
2. Verificar conexion con autenticacion integrada y con contraseña proporcionada externamente, asi como el fallo sin credenciales.
3. Importar JPG y otros formatos admitidos; verificar que el fichero original no se borra y que la miniatura mantiene las proporciones.
4. Guardar una imagen y varios tipos; provocar un error SQL controlado y comprobar la reversión de los registros.
5. Probar la eliminacion de una imagen y de su miniatura con permisos normales y con errores de permisos.
6. Comprobar filtros por tipos y fechas, listado de cientos de imagenes, visionado individual y presentaciones.
7. Comprobar el cierre de ventanas y que la carpeta temporal se limpia sin borrar otras carpetas.

## Limitaciones pendientes para validar

- `DameUltimoValor` calcula identificadores con `MAX(Id)+1`: puede fallar bajo concurrencia. Corregirlo requiere revisar el esquema de SQL Server y decidir entre `IDENTITY` o una secuencia antes de migrar los datos.
- La base de datos y el sistema de archivos no comparten transaccion. Si se confirma la insercion SQL y falla la operacion sobre el fichero, o viceversa, podria requerirse reconciliacion. Valorar un flujo de ficheros en staging con compensaciones.
- El programa maneja datos de pacientes: antes de distribuirlo se deben validar controles de acceso, cifrado, backup, auditabilidad y las politicas de privacidad aplicables.
