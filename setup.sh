export DEBIAN_FRONTEND=noninteractive

apt-get install nginx php php-fpm -y

mkdir -p /var/www/arjuna.a01.com

mkdir -p /var/www/abimanyu.a01

cp -r ~/arjuna.a01.com /var/www/arjuna.a01.com

cp ~/nginx/arjuna.a01.com /etc/nginx/sites-available/arjuna.a01.com

ln -sf /etc/nginx/sites-available/arjuna.a01.com /etc/nginx/sites-enabled

rm -f /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

service apache2 stop

service nginx restart

service php7.2-fpm start

