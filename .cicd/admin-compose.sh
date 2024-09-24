### Amd 64 ###
$database = "sqlite"
$environment = "development"

docker compose version
docker compose -f .cicd/compose/docker-compose.$database.yaml --env-file .cicd/compose/vars-$environment.env up -d
docker compose -f .cicd/compose/docker-compose.$database.yaml --env-file .cicd/compose/vars-$environment.env down



### Arm 64 ###
# Setup Folders
# Code
sudo mkdir -p /home/iot/code/Admin
sudo chmod 777 /home/iot/code/Admin
# Data
sudo mkdir -p /home/iot/data/Admin
sudo mkdir -p /home/iot/data/Admin/SQLite
sudo mkdir -p /home/iot/data/Admin/MySql
sudo mkdir -p /home/iot/data/Admin/MongoDb
sudo chmod 777 /home/iot/data/Admin
sudo chmod 777 /home/iot/data/Admin/SQLite
sudo chmod 777 /home/iot/data/Admin/MySql
sudo chmod 777 /home/iot/data/Admin/MongoDb

cd /home/iot/code/Admin

$database = "sqlite"
$environment = "test"

sudo docker compose version
sudo docker compose -f docker-compose.$database.yaml --env-file vars-$environment.env up -d
sudo docker compose -f docker-compose.$database.yaml --env-file vars-$environment.env down

# Clean-up
sudo rm -rf /home/iot/code/Admin
sudo rm -rf /home/iot/data/Admin
sudo rm -rf /home/iot/data/Admin/SQLite
sudo rm -rf /home/iot/data/Admin/MySql
sudo rm -rf /home/iot/data/Admin/MongoDb