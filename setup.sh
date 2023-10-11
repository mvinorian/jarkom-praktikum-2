apt-get install bind9 git -y

cp ~/named.conf.local /etc/bind/named.conf.local

cp ~/named.conf.options /etc/bind/named.conf.options

mkdir -p /etc/bind/praktikum

cp ~/arjuna.a01.com /etc/bind/praktikum/arjuna.a01.com

cp ~/abimanyu.a01.com /etc/bind/praktikum/abimanyu.a01.com

cp ~/2.169.192.in-addr.arpa /etc/bind/praktikum/2.169.192.in-addr.arpa

service bind9 restart
