apt-get install bind9 -y

cp ~/named.conf.local /etc/bind/named.conf.local

cp ~/named.conf.options /etc/bind/named.conf.options

mkdir -p /etc/bind/baratayuda

cp ~/baratayuda.abimanyu.a01.com /etc/bind/baratayuda/baratayuda.abimanyu.a01.com

service bind9 restart
