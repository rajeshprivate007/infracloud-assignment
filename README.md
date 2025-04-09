# CSVServer Solution - Part I

# 1. Pull the Docker image

docker pull infracloudio/csvserver:latest

# 2. Run the image
docker run -d --name csvserver infracloudio/csvserver:latest

# 3. Generate input file
./gencsv.sh 2 8

# 4. Run the container after input file created

docker run -d \
  --name csvserver \
  -v "$(pwd)/inputFile:/csvserver/inputdata" \
  infracloudio/csvserver:latest

# 5. Check container logs

docker logs <container_id>

# 6. Check port inside container

netstat -tuln

# 7. Run the container with port mapping

docker run -d \
  --name csvserver \
  -v "$(pwd)/inputFile:/csvserver/inputdata" \
  -p 9393:9300 \
  -e CSVSERVER_BORDER="Orange" \
  infracloudio/csvserver:latest

# 8. Access the app (The IP should be public IP of VM else localhost if we try to access inside server).Below is my VM IP.

http://13.74.54.76:9393/ 
