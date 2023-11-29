
# Ejecutar una instancia de PostgreSQL
docker run -d --name postgres -e POSTGRES_USER=mi_usuario -e POSTGRES_PASSWORD=mi_contraseña -e POSTGRES_DB=mi_base_de_datos -p 5432:5432 postgres:alpine

docker run -d -p 3000:3000 --name metabase -v ${pwd}/metabase-data:/metabase-data -v ${pwd}/metabase-logs:/metabase-logs -v ${pwd}/metabase-plugins:/metabase-plugins -e "MB_DB_TYPE=postgres" -e "MB_DB_DBNAME=nombre_de_tu_base_de_datos" -e "MB_DB_PORT=5432" -e "MB_DB_USER=tu_usuario" -e "MB_DB_PASS=tu_contraseña" -e "MB_DB_HOST=tu_host_postgres" metabase/metabase
