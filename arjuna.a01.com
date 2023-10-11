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
