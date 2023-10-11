upstream worker {
        server 192.169.3.1:8001;
        server 192.169.3.2:8002;
        server 192.169.3.3:8003;
}

server {
        listen 80;
        server_name arjuna.a01.com;

        location / {
                proxy_pass http://worker;
        }
}

