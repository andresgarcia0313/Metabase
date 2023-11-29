# Rutas relativas
$dataPath = ".\metabase\data"
$logsPath = ".\metabase\logs"
$pluginsPath = ".\metabase\plugins"

# Verifica y crea las carpetas si no existen
$dataVolume = If (Test-Path $dataPath) { $dataPath } Else { New-Item -ItemType Directory -Path $dataPath }
$logsVolume = If (Test-Path $logsPath) { $logsPath } Else { New-Item -ItemType Directory -Path $logsPath }
$pluginsVolume = If (Test-Path $pluginsPath) { $pluginsPath } Else { New-Item -ItemType Directory -Path $pluginsPath }

# Ejecuta el contenedor de Docker
docker run -d -p 3000:3000 --name metabase -v ${pwd}:/metabase-data -v ${pwd}:/metabase-logs -v ${pwd}:/metabase-plugins metabase/metabase