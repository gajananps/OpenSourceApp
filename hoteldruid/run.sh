 #!/bin/bash
currentpath=$(pwd)
sudo docker network create opensourceapp
sudo docker run -it -d --network trainingapp --name HotelDruidDB -e MYSQL_USER=chnadmin -e MYSQL_PASSWORD=Chnadmin@12345 -e MYSQL_ROOT_PASSWORD=SQL@12345 -e MYSQL_DATABASE=hoteldruiddb -p 3306:3306  mysql:8.0.39
sudo cd $currentpath/app
sudo docker build -t hoteldruidapp:3.0.6 ./app
sudo docker run -d --network opensourceapp --name HotelDruidApp -p 80:80 hoteldruidapp:3.0.6