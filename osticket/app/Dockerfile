FROM ubuntu:22.04

RUN apt update && apt upgrade -y

RUN apt-get install wget curl unzip net-tools vim -y

RUN apt install software-properties-common ca-certificates lsb-release apt-transport-https -y

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt update -y

RUN apt install apache2 -y

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata

RUN apt -y install php8.2 php8.2-mysql php8.2-zip php8.2-gd php8.2-mbstring php8.2-curl php8.2-xml php8.2-imap php8.2-intl php8.2-apcu 

RUN apt -y remove php8.2-mysql*

RUN apt -y install php8.2-mysql* php8.2-bz2 php8.2-tidy

COPY ./info.php /var/www/html/

COPY ./php.ini /etc/php/8.2/apache2/

WORKDIR /opt

RUN wget https://github.com/osTicket/osTicket/releases/download/v1.18.1/osTicket-v1.18.1.zip

RUN unzip osTicket-v1.18.1.zip

RUN mv upload osticket

RUN rm -rf osTicket-v1.18.1.zip scripts/

RUN chown -R www-data:www-data osticket

RUN chmod -R 775 osticket

RUN mv /opt/osticket /var/www/html

WORKDIR /var/www/html/osticket/include

RUN mv ost-sampleconfig.php ost-config.php

WORKDIR /var/www/html

EXPOSE 80
EXPOSE 443

CMD ["apache2ctl", "-D", "FOREGROUND"]
