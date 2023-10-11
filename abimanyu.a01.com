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
ns1             IN      A       192.169.2.2	; IP Werkudara
baratayuda      IN      NS      ns1
