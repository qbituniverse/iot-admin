### Debug on Pi ###
# Setup Folders
sudo mkdir -p /home/iot/code/Admin/IoT.Admin.Web
sudo chmod 777 /home/iot/code/Admin/IoT.Admin.Web
sudo chmod 777 /home/iot/code/Admin

# Compile and Copy
# Use local Visual Studio Publish Profile

# Run
cd /home/iot/code/Admin/IoT.Admin.Web
export ASPNETCORE_ENVIRONMENT=Test
#dotnet IoT.Admin.Web.dll --no-launch-profile
dotnet IoT.Admin.Web.dll --launch-profile "Web-Test"

# Clean-up
sudo rm -rf /home/iot/code/Admin/IoT.Admin.Web



### Build Docker Images ###
docker buildx ls
docker buildx create --use --bootstrap --name iot-admin-buildx
docker buildx build --push --platform linux/amd64,linux/arm64 -t qbituniverse/iot-admin-web:latest -f .cicd/docker/Dockerfile-iot-admin-web .
docker buildx rm -f iot-admin-buildx



### Run Single Conrainer ###
sudo docker network create iot-admin
sudo docker run --privileged -d --restart=always --name iot-admin-web -e TZ=Europe/Warsaw -p 8004:8080 qbituniverse/iot-admin-web:latest
sudo docker rm -fv iot-admin-web
sudo docker rmi -f qbituniverse/iot-admin-web:latest
