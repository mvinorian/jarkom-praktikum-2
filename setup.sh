export DEBIAN_FRONTEND=noninteractive

apt-get install nginx php php-fpm git -y

cp -r ~/arjuna.a01.com /var/www
cp -r ~/abimanyu.a01.com /var/www
cp -r ~/parikesit.abimanyu.a01.com /var/www
cp -r ~/rjp.baratayuda.abimanyu.a01.com /var/www

cp ~/nginx/arjuna.a01.com /etc/nginx/sites-available/arjuna.a01.com
cp ~/apache2/abimanyu.a01.com.conf /etc/apache2/sites-available/abimanyu.a01.com.conf
cp ~/apache2/parikesit.abimanyu.a01.com.conf /etc/apache2/sites-available/parikesit.abimanyu.a01.com.conf
cp ~/apache2/rjp.baratayuda.abimanyu.a01.com.conf /etc/apache2/sites-available/rjp.baratayuda.abimanyu.a01.com.conf

cp ~/apache2/ports.conf /etc/apache2/ports.conf

ln -sf /etc/nginx/sites-available/arjuna.a01.com /etc/nginx/sites-enabled
rm -f /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

rm -f /etc/apache2/.htpasswd
htpasswd -cb /etc/apache2/.htpasswd Wayang baratayudaa01

a2ensite abimanyu.a01.com
a2ensite parikesit.abimanyu.a01.com
a2ensite rjp.baratayuda.abimanyu.a01.com
a2enmod rewrite

service apache2 restart

service nginx restart

service php7.2-fpm start

