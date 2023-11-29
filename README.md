## README EJECUTAR METABASE

Este script de PowerShell facilita la configuración de volúmenes para la persistencia de datos y configuraciones al ejecutar un contenedor Docker de Metabase.

### Pasos Realizados por el Script

1. **Definición de Rutas Relativas:**
   - Se establecen rutas relativas para los directorios de datos, logs y plugins de Metabase.

    ```powershell
    $dataPath = ".\metabase\data"
    $logsPath = ".\metabase\logs"
    $pluginsPath = ".\metabase\plugins"
    ```

2. **Verificación y Creación de Carpetas:**
   - Se verifica la existencia de las carpetas especificadas.
   - Si las carpetas no existen, se crean utilizando el cmdlet `New-Item`.

    ```powershell
    $dataVolume = If (Test-Path $dataPath) { $dataPath } Else { New-Item -ItemType Directory -Path $dataPath }
    $logsVolume = If (Test-Path $logsPath) { $logsPath } Else { New-Item -ItemType Directory -Path $logsPath }
    $pluginsVolume = If (Test-Path $pluginsPath) { $pluginsPath } Else { New-Item -ItemType Directory -Path $pluginsPath }
    ```

3. **Ejecución del Contenedor Docker:**
   - Se ejecuta un contenedor Docker de Metabase con los volúmenes configurados para los directorios de datos, logs y plugins.

    ```powershell
    docker run -d -p 3000:3000 --name metabase -v ${dataVolume}:/metabase-data -v ${logsVolume}:/metabase-logs -v ${pluginsVolume}:/metabase-plugins metabase/metabase
    ```

### Notas Importantes

- Asegúrate de tener Docker instalado en tu sistema antes de ejecutar el script.
- Este script utiliza rutas relativas. Asegúrate de ejecutarlo desde la carpeta correcta para garantizar que las rutas sean válidas.
- Las carpetas de datos, logs y plugins se crean si no existen.

### Ejecución del Script

1. Abre PowerShell.
2. Ubicate en la carpeta donde quieres ejecutarlo por que sera donde guarde los datos metabase
3. Copia y pega el contenido del script.
4. Ejecuta el script.

Este script simplifica la configuración inicial de Metabase, asegurando que los volúmenes necesarios estén en su lugar para una persistencia eficaz de datos y configuraciones.

# Nota

Metabase se ejecutara con la base de datos h2 que es la base de datos por defecto.

