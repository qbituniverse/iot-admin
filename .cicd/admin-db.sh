### SQLite Browser ###
# Network
docker network create iot-admin

# Database
$DB_DIR=""
export DB_DIR=""

docker run -d --name iot-admin-sqlitebrowser --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Europe/Warsaw -p 3007:3000 -v ${DB_DIR}:/data/db --restart unless-stopped lscr.io/linuxserver/sqlitebrowser:latest
docker logs iot-admin-sqlitebrowser

# Browse
http://localhost:3000

# Queries
SELECT * FROM ApiLogs ORDER BY TimeStamp DESC
SELECT * FROM WebLogs ORDER BY TimeStamp DESC

# Clean-up
docker rm -v -f iot-admin-sqlitebrowser
docker network remove iot-admin



### MySql ###
# Network
docker network create iot-admin

# Database
$DB_PWD=""
$DB_DIR=""

docker run -d --name iot-admin-mysql --network iot-admin -e TZ=Europe/Warsaw -e MYSQL_ROOT_PASSWORD=${DB_PWD} -e MYSQL_DATABASE=Admin -v ${DB_DIR}:/var/lib/mysql -d -p 3307:3306 mysql:latest
docker logs iot-admin-mysql

# Queries
SELECT * FROM IotAdmin.ApiLogs ORDER BY TimeStamp DESC;
SELECT * FROM IotAdmin.WebLogs ORDER BY TimeStamp DESC;

# Clean-up
docker rm -v -f iot-admin-mysql
docker network remove iot-admin



### Mongo DB ###
# Network
docker network create iot-admin

# Database
$DB_DIR=""

docker run -d --name iot-admin-mongodb --network iot-admin -e TZ=Europe/Warsaw -v ${DB_DIR}:/data/db -p 27007:27017 mongo:latest
docker logs iot-admin-mongodb

# Clean-up
docker rm -v -f iot-admin-mongodb
docker network remove compose_iot-admin



### Mongo Express ###
docker run -d --name iot-admin-mongoexpress --network compose_iot-admin -e ME_CONFIG_MONGODB_SERVER=iot-admin-mongodb -e TZ=Europe/Warsaw -p 8007:8081 mongo-express:latest
docker logs iot-admin-mongoexpress

# Browse
# admin:pass
http://localhost:8007

# Clean-up
docker rm -v -f iot-admin-mongoexpress
