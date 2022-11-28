# 28-11-2022

# Troubleshooting - Pieter Dc

## Network access layer

- kabels checken

        kabel was niet plugged in bij webt network adapter

## Routing layer

- ip's checken

    ip a

- ip van webt server op eth1 klopte niet

    sudo dnf install -y nano
    sudo nano /etc/sysconfig/network-scripts/ifcfg-eth1
    IPADDR=192.168.76.72
    NETMASK=255.255.255.0
    sudo systemctl restart NetworkManager
    sudo ip link set eth1 down
    sudo ip link set eth1 up
    ip a


- check pings

        (from dbt to webt)
        ping 192.168.76.72

        (from webt to dbt)
        ping 192.168.76.73

- linuxmint vm ping to webt

        change ipv4 to manual in linuxmint and give it
        ip  192.168.76.100
        then ping 192.168.76.72

## Transport layer

- check if apache is running

        sudo systemctl status httpd
        sudo systemctl enable httpd
        sudo systemctl start httpd
        sudo systemctl status httpd

- check if local machine can connect to apache

        curl localhost -> connection refused on port 80

- check if firewall rules are set correctly

        sudo firewall-cmd --list-all
        (https and http is missing)

- add firewall rules

        sudo firewall-cmd --add-service=http
        sudo firewall-cmd --add-service=https
        sudo firewall-cmd --add-service=http --permanent
        sudo firewall-cmd --add-service=https --permanent
        sudo firewall-cmd --list-all
        sudo firewall-cm --reload

## Application layer

- check if local machine can connect

        curl https://localhost --insecure

- configuring correct SELinux

        cd /var/www/
        ls -Z

        cd /html
        ls -Z 

        (test.php doesnt have the right SELinux settings)
        sudo chcon -t httpd_sys_content_t test.php

        ls -Z


        (allow SELinux to connect to HTTP)
        sudo setsebool httpd_can_network_connect_db on

- you should now be able to connect to your website and database via linuxmint

        open firefox and surf to https://192.168.76.72
        or
        on the webt vm itself, curl https://localhost/test.php --insecure




