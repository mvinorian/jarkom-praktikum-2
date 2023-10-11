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
