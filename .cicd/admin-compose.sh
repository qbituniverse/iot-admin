### Amd 64 ###
$env:DB_PWD=""
$env:DB_DIR=""

docker compose version
docker compose -f .cicd/compose/docker-compose.sqlite.yaml up -d
docker compose -f .cicd/compose/docker-compose.sqlite.yaml down



### Arm 64 ###
# Setup Folders
sudo mkdir -p /home/iot/code/Admin
sudo mkdir -p /home/iot/data/Admin
sudo mkdir -p /home/iot/data/Admin/SQLite
sudo chmod 777 /home/iot/code/Admin
sudo chmod 777 /home/iot/data/Admin
sudo chmod 777 /home/iot/data/Admin/SQLite
cd /home/iot/code/Admin

export DB_PWD=""
export DB_DIR=""

sudo docker compose version
sudo docker compose -f docker-compose.sqlite.yaml up -d
sudo docker compose -f docker-compose.sqlite.yaml down

# Clean-up
sudo rm -rf /home/iot/code/Admin
sudo rm -rf /home/iot/data/Admin
sudo rm -rf /home/iot/data/Admin/SQLite