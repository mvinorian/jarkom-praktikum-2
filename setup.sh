export DEBIAN_FRONTEND=noninteractive

apt-get install nginx php php-fpm -y

mkdir -p /var/www/arjuna.a01.com
mkdir -p /var/www/abimanyu.a01.com

cp -r ~/arjuna.a01.com /var/www
cp -r ~/abimanyu.a01.com /var/www

cp ~/nginx/arjuna.a01.com /etc/nginx/sites-available/arjuna.a01.com
cp ~/apache2/abimanyu.a01.com /etc/apache2/sites-available/abimanyu.a01.com

ln -sf /etc/nginx/sites-available/arjuna.a01.com /etc/nginx/sites-enabled
ln -sf /etc/apache2/sites-available/abimanyu.a01.com /etc/apache2/sites-enabled

rm -f /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

service apache2 restart

service nginx restart

service php7.2-fpm start

