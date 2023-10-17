# Dokumentasi Jarkom Praktikum 2

| Nama | Muhammad Ersya Vinorian |
| :--- | :---------------------- |
| NRP  | 5025211045              |

<hr/>

## Table of Contents

- [Table of Contets](#table-of-contents)
- [Soal 1](#soal-1)
  - [Router Network](#router-network)
  - [ArjunaLoadBalancer Network](#arjunaloadbalancer-network)
  - [SadewaClient Network](#sadewaclient-network)
  - [NakulaClient Network](#nakulaclient-network)
  - [YudhistiraDNSMaster Network](#yudhistiradnsmaster-network)
  - [WerkudaranDNSSlave Network](#werkudaradnsslave-network)
  - [PrabukusumaWebServer Network](#prabukusumawebserver-network)
  - [AbimanyuWebServer Network](#abimanyuwebserver-network)
  - [WisanggeniWebServer Network](#wisanggeniwebserver-network)
- [Soal 2](#soal-2)
- [Soal 3](#soal-3)
- [Soal 4](#soal-4)
- [Soal 5](#soal-5)
- [Soal 6](#soal-6)
- [Soal 7](#soal-7)
- [Soal 8](#soal-8)
- [Soal 9 dan 10](#soal-9-dan-10)
- [Soal 11](#soal-11)
- [Soal 12](#soal-12)
- [Soal 13](#soal-13)
- [Soal 14](#soal-14)
- [Soal 15](#soal-15)
- [Soal 16](#soal-16)
- [Soal 17](#soal-17)
- [Soal 18](#soal-18)
- [Soal 19](#soal-19)
- [Soal 20](#soal-20)
- Konfigurasi Setiap Node
  - [ArjunaLoadBalancer Config](https://github.com/mvinorian/jarkom-praktikum-2/tree/arjuna)
  - [SadewaClient Config](https://github.com/mvinorian/jarkom-praktikum-2/tree/sadewa)
  - [NakulaClient Config](https://github.com/mvinorian/jarkom-praktikum-2/tree/nakula)
  - [YudhistiraDNSMaster Config](https://github.com/mvinorian/jarkom-praktikum-2/tree/yudhistira)
  - [WerkudaranDNSSlave Config](https://github.com/mvinorian/jarkom-praktikum-2/tree/werkudara)
  - [PrabukusumaWebServer Config](https://github.com/mvinorian/jarkom-praktikum-2/tree/prabukusuma)
  - [AbimanyuWebServer Config](https://github.com/mvinorian/jarkom-praktikum-2/tree/abimanyu)
  - [WisanggeniWebServer Config](https://github.com/mvinorian/jarkom-praktikum-2/tree/wisanggeni)

## Soal 1

> Yudhistira akan digunakan sebagai DNS Master, Werkudara sebagai DNS Slave, Arjuna merupakan Load Balancer yang terdiri dari beberapa Web Server yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Buatlah topologi dengan pembagian [sebagai berikut](https://docs.google.com/spreadsheets/d/1OqwQblR_mXurPI4gEGqUe7v0LSr1yJViGVEzpMEm2e8/edit?usp=sharing). Folder topologi dapat diakses pada [drive berikut](https://drive.google.com/drive/folders/1Ij9J1HdIW4yyPEoDqU1kAwTn_iIxg3gk?usp=sharing).

Berikut adalah hasil topologi yang dibuat.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/0e8829cd-b178-43b6-8e99-f5abe315b176)

Untuk konfigurasi jaringan pada masing-masing _node_-nya adalah sebagai berikut.

### Router Network

```
auto eth0
iface eth0 inet dhcp
	up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.169.0.0/16

auto eth1
iface eth1 inet static
	address 192.169.1.0
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 192.169.2.0
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 192.169.3.0
	netmask 255.255.255.0
```

### ArjunaLoadBalancer Network

```
auto eth0
iface eth0 inet static
	address 192.169.1.1
	netmask 255.255.255.0
	gateway 192.169.1.0
	up echo nameserver 192.169.2.1 > /etc/resolv.conf
	up echo nameserver 192.169.2.2 >> /etc/resolv.conf

```

### SadewaClient Network

```
auto eth0
iface eth0 inet static
	address 192.169.1.2
	netmask 255.255.255.0
	gateway 192.169.1.0
	up echo nameserver 192.169.2.1 > /etc/resolv.conf
	up echo nameserver 192.169.2.2 >> /etc/resolv.conf
```

### NakulaClient Network

```
auto eth0
iface eth0 inet static
	address 192.169.1.3
	netmask 255.255.255.0
	gateway 192.169.1.0
	up echo nameserver 192.169.2.1 > /etc/resolv.conf
	up echo nameserver 192.169.2.2 >> /etc/resolv.conf
```

### YudhistiraDNSMaster Network

```
auto eth0
iface eth0 inet static
	address 192.169.2.1
	netmask 255.255.255.0
	gateway 192.169.2.0
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

```

### WerkudaraDNSSlave Network

```
auto eth0
iface eth0 inet static
	address 192.169.2.2
	netmask 255.255.255.0
	gateway 192.169.2.0
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

```

### PrabukusumaWebServer Network

```
auto eth0
iface eth0 inet static
	address 192.169.3.1
	netmask 255.255.255.0
	gateway 192.169.3.0
	up echo nameserver 192.169.2.1 > /etc/resolv.conf
	up echo nameserver 192.169.2.2 >> /etc/resolv.conf
```

### AbimanyuWebServer Network

```
auto eth0
iface eth0 inet static
	address 192.169.3.2
	netmask 255.255.255.0
	gateway 192.169.3.0
	up echo nameserver 192.169.2.1 > /etc/resolv.conf
	up echo nameserver 192.169.2.2 >> /etc/resolv.conf
```

### WisanggeniWebServer Network

```
auto eth0
iface eth0 inet static
	address 192.169.3.3
	netmask 255.255.255.0
	gateway 192.169.3.0
	up echo nameserver 192.169.2.1 > /etc/resolv.conf
	up echo nameserver 192.169.2.2 >> /etc/resolv.conf
```

Perintah `up [command]` akan menjalankan `command` ketika _node_ memulai ulang.

## Soal 2

> Buatlah website utama pada node arjuna dengan akses ke arjuna.yyy.com dengan alias www.arjuna.yyy.com dengan yyy merupakan kode kelompok.

Dapat dilakukan dengan membuat konfigurasi pada dns master sebagai berikut.

```bind
; file yudhistira:/etc/bind/praktikum/arjuna.a01.com

$TTL    604800
@       IN      SOA     arjuna.a01.com. root.arjuna.a01.com.    (
                        2023100901      ; Serial
                           6048000      ; Refresh
                             86400      ; Retry
                           2419200      ; Expire
                            604800 )    ; Negative Cache TTL
;
@       IN      NS      arjuna.a01.com.
@       IN      A       192.169.1.1     ; IP Arjuna
www     IN      CNAME   arjuna.a01.com.
```

```nginx
# file yudhistira:/etc/bind/named.conf.local

zone "arjuna.a01.com" {
  type master;
  file "/etc/bind/praktikum/arjuna.a01.com";
};
```

Setelah melakukan konfigurasi tersebut, dapat dilakukan `service bind9 restart` dan dilakukan tes dari _client node_ menggunakan perintah `ping arjuna.a01.com` dan `ping www.arjuna.a01.com`.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/05bc1efb-f5ec-4c54-8d0e-6890cff8f307)

## Soal 3

> Dengan cara yang sama seperti soal nomor 2, buatlah website utama dengan akses ke abimanyu.yyy.com dan alias www.abimanyu.yyy.com.

Seperti pada soal sebelumnya, dapat ditambahkan konfigurasi pada dns master sebagai berikut.

```bind
; file yudhistira:/etc/bind/praktikum/abimanyu.a01.com

$TTL            604800
@               IN      SOA     abimanyu.a01.com. root.abimanyu.a01.com.    (
                                2023100902	  ; Serial
                                   6048000	  ; Refresh
                                     86400	  ; Retry
                                   2419200	  ; Expire
                                    604800 )  ; Negative Cache TTL
;
@               IN      NS      abimanyu.a01.com.
@               IN      A       192.169.3.2	  ; IP Abimanyu
www             IN      CNAME   abimanyu.a01.com.
```

```nginx
# file yudhistira:/etc/bind/named.conf.local

zone "abimanyu.a01.com" {
  type master;
  file "/etc/bind/praktikum/abimanyu.a01.com";
};
```

Setelah melakukan konfigurasi tersebut, dapat dilakukan `service bind9 restart` dan dilakukan tes dari _client node_ menggunakan perintah `ping abimanyu.a01.com` dan `ping www.abimanyu.a01.com`.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/0fecd3d7-f9f4-4620-a41c-5a62774bdb6d)

## Soal 4

> Kemudian, karena terdapat beberapa web yang harus di-deploy, buatlah subdomain parikesit.abimanyu.yyy.com yang diatur DNS-nya di Yudhistira dan mengarah ke Abimanyu.

Subdomain dapat ditambahkan pada konfigurasi `abimanyu.a01.com`.

```bind
; file yudhistira:/etc/bind/praktikum/abimanyu.a01.com

$TTL            604800
@               IN      SOA     abimanyu.a01.com. root.abimanyu.a01.com.    (
                                2023100902	; Serial
                                   6048000	; Refresh
                                     86400	; Retry
                                   2419200	; Expire
                                    604800 )	; Negative Cache TTL
;
@               IN      NS      abimanyu.a01.com.
@               IN      A       192.169.3.2	; IP Abimanyu
www             IN      CNAME   abimanyu.a01.com.
parikesit       IN      A       192.169.3.2	; IP Abimanyu
www.parikesit	IN	CNAME	parikesit.abimanyu.a01.com.
```

Setelah melakukan konfigurasi tersebut, dapat dilakukan `service bind9 restart` dan dilakukan tes dari _client node_ menggunakan perintah `ping parikesit.abimanyu.a01.com` dan `ping www.parikesit.abimanyu.a01.com`.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/f2e64bc8-cbf4-431c-b2de-1d1e8bc70a30)

## Soal 5

> Buat juga reverse domain untuk domain utama. (Abimanyu saja yang direverse)

Untuk menambahkan reverse domain dapat ditambahkan konfigurasi baru sebagai berikut.

```bind
; file yudhistira:/etc/bind/praktikum/3.169.192.in-addr.arpa

$TTL                            604800
@                               IN      SOA     abimanyu.a01.com. root.abimanyu.a01.com. (
                                                2023100903      ; Serial
                                                   6048000      ; Refresh
                                                     86400      ; Retry
                                                   2419200      ; Expire
                                                    604800 )    ; Negative Cache TTL
;
3.169.192.in-addr.arpa.         IN      NS      abimanyu.a01.com.
2                               IN      PTR     abimanyu.a01.com.
```

```nginx
# file yudhistira:/etc/bind/praktikum/3.169.192.in-addr.arpa

zone "arjuna.a01.com" {
  type master;
  file "/etc/bind/praktikum/arjuna.a01.com";
};

zone "abimanyu.a01.com" {
  type master;
  file "/etc/bind/praktikum/abimanyu.a01.com";
};

zone "3.169.192.in-addr.arpa" {
  type master;
  file "/etc/bind/praktikum/3.169.192.in-addr.arpa";
};
```

`3.169.192` merupakan _reverse_ dari 3 byte pertama IP abimanyu `192.169.3.2`, dan _record_ PTR ditambahkan dari byte ke-empat IP abimanyu.

Setelah melakukan konfigurasi tersebut, dapat dilakukan `service bind9 restart` dan dilakukan tes dari _client node_ menggunakan perintah `host -t PTR 192.169.3.2`.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/8f49f814-17f5-4fba-9280-4966b65a8b07)

## Soal 6

> Agar dapat tetap dihubungi ketika DNS Server Yudhistira bermasalah, buat juga Werkudara sebagai DNS Slave untuk domain utama.

Pada _node_ yudhistira dan werkudara perlu diubah `named.conf.options` menjadi seperti berikut.

```nginx
# file /etc/bind/named.conf.options

options {
  directory "/var/cache/bind";
  //========================================================================
  // If BIND logs error messages about the root key being expired,
  // you will need to update your keys.  See https://www.isc.org/bind-keys
  //========================================================================
  // dnssec-validation auto;
  allow-query { any; };

  auth-nxdomain no;    # conform to RFC1035
  listen-on-v6 { any; };
};
```

Kemudian perlu ditambahkan pada setiap konfigurasi pada `named.conf.local` di yudhistira menjadi seperti berikut.

```nginx
# file yudhistira:/etc/bind/named.conf.local

zone "arjuna.a01.com" {
  type master;
  notify yes;
  also-notify { 192.169.2.2; };
  allow-transfer { 192.169.2.2; };
  file "/etc/bind/praktikum/arjuna.a01.com";
};

zone "abimanyu.a01.com" {
  type master;
  notify yes;
  also-notify { 192.169.2.2; };
  allow-transfer { 192.169.2.2; };
  file "/etc/bind/praktikum/abimanyu.a01.com";
};

zone "3.169.192.in-addr.arpa" {
  type master;
  notify yes;
  also-notify { 192.169.2.2; };
  allow-transfer { 192.169.2.2; };
  file "/etc/bind/praktikum/3.169.192.in-addr.arpa";
};
```

IP yang dimasukkan dalam `also-notify` dan `allow-transfer` adalah IP dari werkudara.

Setelah itu pada _node_ werkudara perlu dilakukan konfigurasi berikut.

```nginx
# file werkudara:/etc/bind/named.conf.local

zone "arjuna.a01.com" {
        type slave;
        masters { 192.169.2.1; };
        file "/var/lib/bind/arjuna.a01.com";
};

zone "abimanyu.a01.com" {
        type slave;
        masters { 192.169.2.1; };
        file "/var/lib/bind/abimanyu.a01.com";
};

zone "3.169.192.in-addr.arpa" {
        type slave;
        masters { 192.169.2.1; };
        file "/var/lib/bind/3.169.192.in-addr.arpa";
};

```

Untuk melakukan tes, dapat dimatikan terlebih dahulu service bind9 pada _node_ yudhistira menggunakan perintah `service bind9 stop` dan restart bind9 pada _node_ werkudara dengan `service bind9 restart`. Kemudian bisa dilakukan `ping` pada semua domain dan subdomain yang telah dibuat.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/6b6593bc-315a-46d1-b89c-bebce520b797)

## Soal 7

> Seperti yang kita tahu karena banyak sekali informasi yang harus diterima, buatlah subdomain khusus untuk perang yaitu baratayuda.abimanyu.yyy.com dengan alias www.baratayuda.abimanyu.yyy.com yang didelegasikan dari Yudhistira ke Werkudara dengan IP menuju ke Abimanyu dalam folder Baratayuda.

Dapat menambahkan _record_ NS pada _node_ yudhistira yang menunjuk ke IP werkudara sebagai berikut.

```bind
; file yudhistira:/etc/bind/praktikum/abimanyu.a01.com

$TTL            604800
@               IN      SOA     abimanyu.a01.com. root.abimanyu.a01.com.    (
                                2023100902	; Serial
                                   6048000	; Refresh
                                     86400	; Retry
                                   2419200	; Expire
                                    604800 )	; Negative Cache TTL
;
@               IN      NS      abimanyu.a01.com.
@               IN      A       192.169.3.2	; IP Abimanyu
www             IN      CNAME   abimanyu.a01.com.
parikesit       IN      A       192.169.3.2	; IP Abimanyu
www.parikesit	IN	CNAME	parikesit.abimanyu.a01.com.
ns1             IN      A       192.169.2.2	; IP Werkudara
baratayuda      IN      NS      ns1
```

Setelah itu, dapat ditambahkan konfigurasi untuk baratayuda pada _node_ werkudara.

```bind
; file werkudara:/etc/bind/baratayuda/baratayuda.abimanyu.a01.com

$TTL            604800
@               IN      SOA     baratayuda.abimanyu.a01.com. root.baratayuda.abimanyu.a01.com.    (
                                2023100904              ; Serial
                                   6048000              ; Refresh
                                     86400              ; Retry
                                   2419200              ; Expire
                                    604800 )            ; Negative Cache TTL
;
@               IN      NS      baratayuda.abimanyu.a01.com.
@               IN      A       192.169.3.2             ; IP Abimanyu
www             IN      CNAME   baratayuda.abimanyu.a01.com.
```

```nginx
# file werkudara:/etc/bind/named.conf.local

zone "arjuna.a01.com" {
  type slave;
  masters { 192.169.2.1; };
  file "/var/lib/bind/arjuna.a01.com";
};

zone "abimanyu.a01.com" {
  type slave;
  masters { 192.169.2.1; };
  file "/var/lib/bind/abimanyu.a01.com";
};

zone "3.169.192.in-addr.arpa" {
  type slave;
  masters { 192.169.2.1; };
  file "/var/lib/bind/3.169.192.in-addr.arpa";
};

zone "baratayuda.abimanyu.a01.com" {
  type master;
  file "/etc/bind/baratayuda/baratayuda.abimanyu.a01.com";
};
```

Untuk melakukan tes, dapat distop service bind9 pada yudhistira dan restart bind9 pada werkudara. Setelah itu bisa dilakukan `ping baratayuda.abimanyu.a01.com` pada _node_ client.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/48000a1c-edd9-464d-95b7-b6d67cd430a3)

## Soal 8

> Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses rjp.baratayuda.abimanyu.yyy.com dengan alias www.rjp.baratayuda.abimanyu.yyy.com yang mengarah ke Abimanyu.

Sama seperti soal 4, untuk membuat subdomain perlu menambahkan konfigurasi pada _node_ werkudara sebagai berikut.

```bind
; file werkudara:/etc/bind/baratayuda/baratayuda.abimanyu.a01.com

$TTL            604800
@               IN      SOA     baratayuda.abimanyu.a01.com. root.baratayuda.abimanyu.a01.com.    (
                                2023100904              ; Serial
                                   6048000              ; Refresh
                                     86400              ; Retry
                                   2419200              ; Expire
                                    604800 )            ; Negative Cache TTL
;
@               IN      NS      baratayuda.abimanyu.a01.com.
@               IN      A       192.169.3.2             ; IP Abimanyu
www             IN      CNAME   baratayuda.abimanyu.a01.com.
rjp             IN      A       192.169.3.2             ; IP Abimanyu
www.rjp		IN	CNAME	rjp.baratayuda.abimanyu.a01.com.
```

Setelah melakukan konfigurasi tersebut, dapat dilakukan `service bind9 restart` dan dilakukan tes dari _client node_ menggunakan perintah `ping rjp.baratayuda.abimanyu.a01.com` dan `ping www.rjp.baratayuda.abimanyu.a01.com`.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/c43c3bb6-59fa-4ec3-824a-b38795a25637)

## Soal 9 dan 10

> Arjuna merupakan suatu Load Balancer Nginx dengan tiga worker (yang juga menggunakan nginx sebagai webserver) yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Lakukan deployment pada masing-masing worker.

> Kemudian gunakan algoritma Round Robin untuk Load Balancer pada Arjuna. Gunakan server_name pada soal nomor 1. Untuk melakukan pengecekan akses alamat web tersebut kemudian pastikan worker yang digunakan untuk menangani permintaan akan berganti ganti secara acak. Untuk webserver di masing-masing worker wajib berjalan di port 8001-8003. Contoh:
>
> - Prabakusuma:8001
> - Abimanyu:8002
> - Wisanggeni:8003

Pertama perlu memindahkan resource `arjuna.yyy.com` dari drive ke direktori `/var/www/arjuna.a01.com` pada setiap workernya. Kemudian setiap worker akan dilakukan konfigurasi nginx sesuai dengan port yang ditentukan (8001-8003).

```nginx
# file prabukusuma:/etc/nginx/sites-available/arjuna.a01.com

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
```

```nginx
# file abimanyu:/etc/nginx/sites-available/arjuna.a01.com

server {

	listen 8002;

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
```

```nginx
# file wisanggeni:/etc/nginx/sites-available/arjuna.a01.com

server {

	listen 8003;

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
```

Kemudian untuk konfigurasi _load balancer_ akan dilakukan pada _node_ arjuna sebagai berikut.

```nginx
# file arjuna:/etc/nginx/sites-available/arjuna.a01.com

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
```

Karena algoritma _load balancer_-nya adalah Round Robin maka tidak perlu mendefinisikan algoritma pada upstream, karena secara default algoritma yang dipakai adalah Round Robin.

Setelah menambahkan konfigurasi pada `sites-available` perlu dilakukan _symbolic link_ pada direktori `sites-enabled` menggunakan perintah berikut di setiap _node_ di atas.

```sh
ln -s /etc/nginx/sites-available/arjuna.a01.com /etc/nginx/sites-enabled
```

Setelah itu perlu untuk restart nginx dengan menggunakan `service nginx restart`.

Untuk melakukan tes dapat menggunakan `lynx arjuna.a01.com` pada _client node_ dan melakukan refresh.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/cb31aa09-2d84-43ce-ab11-f0f00efe4b53)

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/f8f18b21-ff00-46cc-8bed-5ef4cfe23cec)

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/4e82130e-bd20-4fae-a81b-9fb302878f69)

Dapat terlihat bahwa setiap kali melakukan refresh, maka akan mengakses web server yang berbeda dan akan berputar secara berurutan.

## Soal 11

> Selain menggunakan Nginx, lakukan konfigurasi Apache Web Server pada worker Abimanyu dengan web server www.abimanyu.yyy.com. Pertama dibutuhkan web server dengan DocumentRoot pada /var/www/abimanyu.yyy

Pertama harus memindahkan resource `abimanyu.yyy.com` dari drive ke `/var/www/abimanyu.a01.com`, kemudian perlu membuat konfigurasi apache sebagai berikut.

```apache
# file abimanyu:/etc/apache2/sites-available/abimanyu.a01.com.conf

<VirtualHost *:80>
	ServerName abimanyu.a01.com
	ServerAlias www.abimanyu.a01.com

	ServerAdmin mvinorian@gmail.com
	DocumentRoot /var/www/abimanyu.a01.com

	ErrorLog ${APACHE_LOG_DIR}/abimanyu.a01.com-error.log
	CustomLog ${APACHE_LOG_DIR}/abimanyu.a01.com-access.log combined
</VirtualHost>
```

Setelah itu perlu dilakukan `a2ensite abimanyu.a01.com` untuk membuat symbolic lynk ke `sites-enabled` dan restart apache2 dengan `service apache2 restart`.

Untuk melakukan tes dapat menggunakan `lynx abimanyu.a01.com/index.php` pada _client node_.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/095ade43-d86c-4b84-bf8c-4a88344260f2)

## Soal 12

> Setelah itu ubahlah agar url www.abimanyu.yyy.com/index.php/home menjadi www.abimanyu.yyy.com/home.

Dapat menggunakan konfigurasi `.htaccess` pada `/var/www/abimanyu.a01.com` sebagai berikut.

```apache
# file abimanyu:/var/www/abimanyu.a01.com/.htaccess

RewriteEngine On

RewriteCond %{REQUEST_URI} ^/index\.php/home$
RewriteRule ^ /home [R=301]

RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^.*$ /index.php [L]
```

Aturan pertama akan me-_redirect_ request dari `/index.php/home` ke `/home`. Kemudian aturan kedua akan me-_redirect_ semua request yang tidak ada file maupun direktorinya ke `/index.php`.

Selanjutnya perlu ditambahkan konfigurasi berikut agar `.htaccess` dapat berjalan.

```apache
# file abimanyu:/etc/apache2/sites-available/abimanyu.a01.com.conf

<VirtualHost *:80>
	ServerName abimanyu.a01.com
	ServerAlias www.abimanyu.a01.com

	ServerAdmin mvinorian@gmail.com
	DocumentRoot /var/www/abimanyu.a01.com

	<Directory /var/www/abimanyu.a01.com>
		Options +FollowSymLinks -Multiviews
		AllowOverride All
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/abimanyu.a01.com-error.log
	CustomLog ${APACHE_LOG_DIR}/abimanyu.a01.com-access.log combined
</VirtualHost>
```

Kemudian perlu dilakukan restart apache2 dengan `service apahce2 restart`.

Untuk melakukan tes dapat menggunakan `lynx abimanyu.a01.com/index.php/home` pada _client node_.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/703032d5-6431-4a61-9239-00405661e2dd)

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/095ade43-d86c-4b84-bf8c-4a88344260f2)

## Soal 13

> Selain itu, pada subdomain www.parikesit.abimanyu.yyy.com, DocumentRoot disimpan pada /var/www/parikesit.abimanyu.yyy

Pertama harus memindahkan resource `parikesit.abimanyu.yyy.com` dari drive ke `/var/www/parikesit.abimanyu.a01.com`, kemudian perlu membuat konfigurasi apache sebagai berikut.

```apache
# file abimanyu:/etc/apache2/sites-available/parikesit.abimanyu.a01.com.conf

<VirtualHost *:80>
	ServerName parikesit.abimanyu.a01.com
	ServerAlias www.parikesit.abimanyu.a01.com

	ServerAdmin mvinorian@gmail.com
	DocumentRoot /var/www/parikesit.abimanyu.a01.com

	ErrorLog ${APACHE_LOG_DIR}/parikesit.abimanyu.a01.com-error.log
	CustomLog ${APACHE_LOG_DIR}/parikesit.abimanyu.a01.com-access.log combined
</VirtualHost>
```

Setelah itu perlu dilakukan `a2ensite parikesit.abimanyu.a01.com` untuk membuat symbolic lynk ke `sites-enabled` dan restart apache2 dengan `service apache2 restart`.

Untuk melakukan tes dapat menggunakan `lynx parakesit.abimanyu.a01.com` pada _client node_.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/b8b7bcb4-cd12-4048-8f7b-537af5539902)

## Soal 14

> Pada subdomain tersebut folder /public hanya dapat melakukan directory listing sedangkan pada folder /secret tidak dapat diakses (403 Forbidden).

Untuk memberi akses pada folder `/public` dan tidak pada folder `/secret` dapat ditambahkan konfigurasi berikut.

```apache
# file abimanyu:/etc/apache2/sites-available/parikesit.abimanyu.a01.com.conf

<VirtualHost *:80>
	ServerName parikesit.abimanyu.a01.com
	ServerAlias www.parikesit.abimanyu.a01.com

	ServerAdmin mvinorian@gmail.com
	DocumentRoot /var/www/parikesit.abimanyu.a01.com

	<Directory /var/www/parikesit.abimanyu.a01.com/public>
		Options +Indexes
	</Directory>

	<Directory /var/www/parikesit.abimanyu.a01.com/secret>
		Options -Indexes
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/parikesit.abimanyu.a01.com-error.log
	CustomLog ${APACHE_LOG_DIR}/parikesit.abimanyu.a01.com-access.log combined
</VirtualHost>
```

Kemudian perlu dilakukan restart apache2 dengan `service apahce2 restart` dan tes dengan `lynx parikesit.abimanyu.a01.com/public` dan `lynx parikesit.abimanyu.a01.com/secret`.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/a7b3b50d-a661-484e-897a-6ad3e494f4e2)

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/3f2affd9-8fe1-433c-a405-6ad0d994cfff)

## Soal 15

> Buatlah kustomisasi halaman error pada folder /error untuk mengganti error kode pada Apache. Error kode yang perlu diganti adalah 404 Not Found dan 403 Forbidden.

Dapat ditambahkan pada `.htaccess` pada `/var/www/parikesit.abimanyu.a01.com` atau dapat juga ditambahkan langsung pada konfigurasinya.

```apache
# file abimanyu:/var/www/parikesit.abimanyu.a01.com/.htaccess

ErrorDocument 403 /error/403.html
ErrorDocument 404 /error/404.html
```

Agar file `.htaccess` dapat berjalan perlu ditambahkan konfigurasi berikut.

```apache
# file abimanyu:/etc/apache2/sites-available/parikesit.abimanyu.a01.com.conf

<VirtualHost *:80>
	ServerName parikesit.abimanyu.a01.com
	ServerAlias www.parikesit.abimanyu.a01.com

	ServerAdmin mvinorian@gmail.com
	DocumentRoot /var/www/parikesit.abimanyu.a01.com

	<Directory /var/www/parikesit.abimanyu.a01.com/public>
		Options +Indexes
	</Directory>

	<Directory /var/www/parikesit.abimanyu.a01.com/secret>
		Options -Indexes
	</Directory>

  <Directory /var/www/parikesit.abimanyu.a01.com>
		Options +FollowSymLinks -Multiviews
		AllowOverride All
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/parikesit.abimanyu.a01.com-error.log
	CustomLog ${APACHE_LOG_DIR}/parikesit.abimanyu.a01.com-access.log combined
</VirtualHost>
```

Kemudian perlu dilakukan restart apache2 dengan `service apahce2 restart` dan tes dengan `lynx parikesit.abimanyu.a01.com/secret` dan `lynx parikesit.abimanyu.a01.com/about`.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/a066b05d-2000-4cb2-b757-a49b64dd7660)

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/27299f48-2799-4c34-95a0-4ec66daf9d98)

## Soal 16

> Buatlah suatu konfigurasi virtual host agar file asset www.parikesit.abimanyu.yyy.com/public/js menjadi
> www.parikesit.abimanyu.yyy.com/js

Dapat menambahkan path alias pada konfigurasi sebagai berikut.

```apache
# file abimanyu:/etc/apache2/sites-available/parikesit.abimanyu.a01.com.conf

<VirtualHost *:80>
	ServerName parikesit.abimanyu.a01.com
	ServerAlias www.parikesit.abimanyu.a01.com

	ServerAdmin mvinorian@gmail.com
	DocumentRoot /var/www/parikesit.abimanyu.a01.com

	<Directory /var/www/parikesit.abimanyu.a01.com/public>
		Options +Indexes
	</Directory>

	<Directory /var/www/parikesit.abimanyu.a01.com/secret>
		Options -Indexes
	</Directory>

  <Directory /var/www/parikesit.abimanyu.a01.com>
		Options +FollowSymLinks -Multiviews
		AllowOverride All
	</Directory>

  Alias "/js" "/var/www/parikesit.abimanyu.a01.com/public/js"

	ErrorLog ${APACHE_LOG_DIR}/parikesit.abimanyu.a01.com-error.log
	CustomLog ${APACHE_LOG_DIR}/parikesit.abimanyu.a01.com-access.log combined
</VirtualHost>
```

Kemudian perlu dilakukan restart apache2 dengan `service apahce2 restart` dan tes dengan `lynx parikesit.abimanyu.a01.com/js`.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/99e3daff-27ab-4d3f-92a7-9d46065ef6ab)

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/494a8832-2a7f-4326-8dc6-74bd5d93e167)

## Soal 17

> Agar aman, buatlah konfigurasi agar www.rjp.baratayuda.abimanyu.yyy.com hanya dapat diakses melalui port 14000 dan 14400.

Sebelum membuat konfigurasi web servernya, perlu untuk menambahkan konfigurasi port dari apache menjadi berikut.

```apache
# file abimanyu:/etc/apache2/ports.conf

Listen 80

Listen 14000
Listen 14400

<IfModule ssl_module>
	Listen 443
</IfModule>

<IfModule mod_gnutls.c>
	Listen 443
</IfModule>
```

Kemudian perlu memindahkan resource `rjp.baratayuda.abimanyu.yyy.com` dari drive ke `/var/www/rjp.baratayuda.abimanyu.a01.com`.

Setelah itu, perlu membuat konfigurasi sebagai berikut.

```apache
# file abimanyu:/etc/apache2/sites-available/rjp.baratayuda.abimanyu.a01.com.conf

<VirtualHost *:14000 *:14400>
	ServerName rjp.baratayuda.abimanyu.a01.com
	ServerAlias www.rjp.baratayuda.abimanyu.a01.com

	ServerAdmin mvinorian@gmail.com
	DocumentRoot /var/www/rjp.baratayuda.abimanyu.a01.com

	ErrorLog ${APACHE_LOG_DIR}/rjp.baratayuda.abimanyu.a01.com-error.log
	CustomLog ${APACHE_LOG_DIR}/rjp.baratayuda.abimanyu.a01.com-access.log combined
</VirtualHost>
```

Setelah itu perlu dilakukan `a2ensite rjp.baratayuda.abimanyu.a01.com` untuk membuat symbolic lynk ke `sites-enabled` dan restart apache2 dengan `service apache2 restart`.

Untuk melakukan tes dapat menggunakan `lynx rjp.baratayuda.abimanyu.a01.com:14000` atau `lynx rjp.baratayuda.abimanyu.a01.com:14400` pada _client node_.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/2d0dbf8f-7a8f-4415-9f48-83048cb88ddd)

## Soal 18

> Untuk mengaksesnya buatlah autentikasi username berupa “Wayang” dan password “baratayudayyy” dengan yyy merupakan kode kelompok. Letakkan DocumentRoot pada /var/www/rjp.baratayuda.abimanyu.yyy.

Untuk membuat username dan password dapat menggunakan perintah `htpasswd -cb /etc/apache2/.htpasswd Wayang baratayudaa01`.

Setelah itu akan dilakukan konfigurasi autentikasi sebagai berikut.

```apache
# file abimanyu:/etc/apache2/sites-available/rjp.baratayuda.abimanyu.a01.com.conf

<VirtualHost *:14000 *:14400>
	ServerName rjp.baratayuda.abimanyu.a01.com
	ServerAlias www.rjp.baratayuda.abimanyu.a01.com

	ServerAdmin mvinorian@gmail.com
	DocumentRoot /var/www/rjp.baratayuda.abimanyu.a01.com

	<Directory /var/www/rjp.baratayuda.abimanyu.a01.com>
		AuthType Basic
		AuthName "Restricted Content"
		AuthUserFile /etc/apache2/.htpasswd
		Require valid-user
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/rjp.baratayuda.abimanyu.a01.com-error.log
	CustomLog ${APACHE_LOG_DIR}/rjp.baratayuda.abimanyu.a01.com-access.log combined
</VirtualHost>
```

Kemudian perlu dilakukan restart apache2 dengan `service apahce2 restart` dan tes dengan `lynx rjp.baratayuda.abimanyu.a01.com:14000` atau `lynx rjp.baratayuda.abimanyu.a01.com:14400`.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/2b7f5eed-1e1f-475c-bb56-1ec25fd6be22)

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/7e8b297c-7d2a-42a2-9b99-75e3a31a523f)

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/3c1c402a-eafd-45c5-93d1-788cb63b90a6)

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/2d0dbf8f-7a8f-4415-9f48-83048cb88ddd)

## Soal 19

> Buatlah agar setiap kali mengakses IP dari Abimanyu akan secara otomatis dialihkan ke www.abimanyu.yyy.com (alias)

Dapat menambahkan konfigurasi sebagai berikut.

```apache
# file abimanyu:/etc/apache2/sites-available/abimanyu.a01.com.conf

<VirtualHost *:80>
	ServerName abimanyu.a01.com
	ServerAlias www.abimanyu.a01.com
  ServerAlias 192.169.3.2

	ServerAdmin mvinorian@gmail.com
	DocumentRoot /var/www/abimanyu.a01.com

	<Directory /var/www/abimanyu.a01.com>
		Options +FollowSymLinks -Multiviews
		AllowOverride All
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/abimanyu.a01.com-error.log
	CustomLog ${APACHE_LOG_DIR}/abimanyu.a01.com-access.log combined
</VirtualHost>
```

Kemudian perlu dilakukan restart apache2 dengan `service apahce2 restart` dan tes dengan `lynx 192.169.3.2`.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/095ade43-d86c-4b84-bf8c-4a88344260f2)

## Soal 20

> Karena website www.parikesit.abimanyu.yyy.com semakin banyak pengunjung dan banyak gambar gambar random, maka ubahlah request gambar yang memiliki substring “abimanyu” akan diarahkan menuju abimanyu.png.

Dapat menambahkan konfigurasi pada `.htaccess` sebagai berikut.

```apache
# file abimanyu:/var/www/parikesit.abimanyu.a01.com/.htaccess

ErrorDocument 403 /error/403.html
ErrorDocument 404 /error/404.html

RewriteEngine On

RewriteCond %{REQUEST_URI} !^/public/images/abimanyu.png
RewriteCond %{REQUEST_URI} abimanyu
RewriteRule \.(jpg|jpeg|png)$ /public/images/abimanyu.png [L]
```

Kemudian perlu dilakukan restart apache2 dengan `service apahce2 restart` dan tes dengan `lynx parikesit.abimanyu.a01.com/iniabimanyuganteng.jpg`.

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/cae6c447-70e9-43c9-9c6d-c600f79826c4)

![image](https://github.com/mvinorian/jarkom-praktikum-2/assets/54766683/6baa4452-dd7e-4241-9e84-f0212b088a8a)
