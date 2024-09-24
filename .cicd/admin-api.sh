### Debug on Pi ###
# Setup Folders
sudo mkdir -p /home/iot/code/Admin/IoT.Admin.Api
sudo chmod 777 /home/iot/code/Admin/IoT.Admin.Api
sudo chmod 777 /home/iot/code/Admin

# Compile and Copy
# Use local Visual Studio Publish Profile

# Run
cd /home/iot/code/Admin/IoT.Admin.Api
export ASPNETCORE_ENVIRONMENT=Test
#dotnet IoT.Admin.Api.dll --no-launch-profile
dotnet IoT.Admin.Api.dll --launch-profile "Api-Test"

# Test
curl -X GET "http://localhost:8001/api/gpio"
curl -X POST "http://localhost:8001/api/gpio/open?pinNumber=23"
curl -X POST "http://localhost:8001/api/gpio/close?pinNumber=23"
curl -X POST "http://localhost:8001/api/gpio/close-all"

# Clean-up
sudo rm -rf /home/iot/code/Admin/IoT.Admin.Api



### Build Docker Images ###
docker buildx ls
docker buildx create --use --bootstrap --name iot-admin-buildx
docker buildx build --push --platform linux/amd64,linux/arm64 -t qbituniverse/iot-admin-api:latest -f .cicd/docker/Dockerfile-iot-admin-api .
docker buildx rm -f iot-admin-buildx



### Run Single Conrainer ###
sudo docker network create iot-admin
sudo docker run --privileged -d --restart=always --name iot-admin-api -e TZ=Europe/Warsaw -p 8001:8080 qbituniverse/iot-admin-api:latest
sudo docker rm -fv iot-admin-api
sudo docker rmi -f qbituniverse/iot-admin-api:latest
