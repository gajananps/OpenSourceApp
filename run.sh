 #!/bin/bash
currentpath=$(pwd)
docker run -d --name osTicketDB -e MYSQL_USER=ostuser -e MYSQL_PASSWORD=Admin@123 -e MYSQL_ROOT_PASSWORD=Root@12345 -e MYSQL_DATABASE=osticketdb -v /opt/docker/db:/var/lib/mysql -p 3306:3306 mariadb:10.6.18
cd $currentpath
docker build -t osticketapp:1.18.1 .
docker run --name osTicketApp -v /opt/docker/app:/var/www/html -p 80:80 -d osticketapp:1.18.1
