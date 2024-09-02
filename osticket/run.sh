 #!/bin/bash
currentpath=$(pwd)
sudo docker run -d --name osTicketDB -e MYSQL_USER=ostuser -e MYSQL_PASSWORD=Admin@123 -e MYSQL_ROOT_PASSWORD=Root@12345 -e MYSQL_DATABASE=osticketdb -v /opt/docker/db:/var/lib/mysql -p 3306:3306 mariadb:10.6.18
sudo cd $currentpath/app
sudo docker build -t osticketapp:1.18.1 ./app
sudo docker run -d --name osTicketApp -p 80:80 osticketapp:1.18.1
