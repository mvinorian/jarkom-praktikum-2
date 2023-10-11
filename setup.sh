apt-get install nginx git -y

cp ~/arjuna.a01.com /etc/nginx/sites-available/arjuna.a01.com

ln -s /etc/nginx/sites-available/arjuna.a01.com /etc/nginx/sites-enabled

rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

service nginx restart

