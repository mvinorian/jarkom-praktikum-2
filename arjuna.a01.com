server {

	listen 8001;

	root /var/www/arjuna.a01.com;

	index index.php index.html index.htm;
	server_name arjuna.a01.com;

	location / {
		try_files $uri $uri/ /index.php?$query_string;
	}

	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
	}

	location ~ /\.ht {
		deny all;
	}

	error_log /var/log/nginx/arjuna.a01.com-error.log;
	access_log /var/log/nginx/arjuna.a01.com-access.log;
}

