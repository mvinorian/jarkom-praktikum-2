export DEBIAN_FRONTEND=noninteractive

apt-get install nginx php php-fpm git -y

mkdir -p /var/www/arjuna.a01.com

cp ~/index.php /var/www/arjuna.a01.com

cp ~/arjuna.a01.com /etc/nginx/sites-available/arjuna.a01.com

ln -s /etc/nginx/sites-available/arjuna.a01.com /etc/nginx/sites-enabled

rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

service apache2 stop

service nginx restart

service php7.2-fpm start

