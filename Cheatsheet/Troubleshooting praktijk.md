30-11-2022

# LAMP Stack troubleshooting- Pieter Deconinck
(Linux Apache Mariadb Php)

## Bottom-up approach

![image](https://user-images.githubusercontent.com/100133263/204807679-4295cb9a-c274-4ad5-948b-0966f814453f.png)


## Network Access Layer + Physical

- VM
  
        Check Virtual Network Adapters
        Check Cable connected

- ip link 

        ip link
        ip -s link (see statistics)
        ip -s link ls [interface] (see specifc network interface)
        ip link ls up (see all running interfaces)
    
        ip link set [interface] up (enable network interface)
        ip link set [interface] down (disable network interface)

## Internet Layer

- ip a
  
        (check ip's and interfaces)

- resetting NetworkManager

        sudo systemctl restart NetworkManager
        sudo ip link set [interface] down
        sudo ip link set [interface] up

- ip route
  
        (check default gateway and networks)
        alternative command: route

- ip interfaces configuration

        /etc/sysconfig/network-scripts/ifcfg-*

- Static IP example
![image](https://user-images.githubusercontent.com/100133263/204814049-b6358d5f-a297-4e05-851d-81a253f99c3d.png)

- Check DNS service

        RHEL: /etc/resolv.conf
        Fedora, Debian, etc: resolvectl dns

- DHCP example
![image](https://user-images.githubusercontent.com/100133263/204814371-7d4eaa67-77ed-49be-a8d6-48bf09b1516b.png)

- Internet Layer checklist

        Ping between hosts
        Ping default GW/DNS
        Query DNS(dig,nslookup,getent)

## Transport Layer

- Check if service is running, enable services, start service

        sudo systemctl status [service]
        sudo systemctl enable [service]
        sudo systemctl start [service]
        sudo systemctl enable --now [service]

- Check port/interface
  
        sudo ss -tulpn
        sudo ss -tl
        sudo ss -tln

        /etc/services

- Firewall

        sudo firewall-cmd --list-all
        sudo firewall-cmd --add-service=[service] --permanent
        sudo firewall-cmd --reload 
        sudo firewall-cmd --list-services

        sudo firewall-cmd --add-port=[port]/tcp
        sudo firewall-cmd --remove-port=[port]/tcp

        sudo firewall-cmd --runtime-to-permanent

        sudo systemctl status firewalld

        sudo firewall-cmd --list-all-zones

## Application layer

- MariaDB
        
        sudo dnf install -y mariadb-server
        Config location: /etc/my.cnf.d/mariadb-server.cnf

- HTTPD (apache)

        sudo dnf install -y httpd
        Config location: /etc/httpd/conf/httpd.conf
        error log: tail -f /var/log/httpd/error_log

        check config: apachectl configtest

        html/php location= /var/www/html

- php
        sudo dnf search php-mysqlnd
        sudo dnf install -y php-mysqlnd

- curl

        curl http://localhost
        curl https://localhost
        curl http://localhost/index.html


- Check the logs

        journalctl

        or systemctl status [service]
        journalctl _PID=[PID]

## SELinux

- Check file context

        ls -Z [file]

- Change file context

        sudo chcon -t httpd_sys_content_t [file]

- Change file context to default value

        sudo restorecon -R /var/www/

- Check booleans

        getsebool -a
        getsebool -a | grep http

- Enable boolean

        sudo setsebool -P httpd_can_network_connect_db on

- Check if SELinux enabled

        getenforce

- Disable or enable SELinux

        setenforce 0
        setenforce 1
    	

## Extra's

## Virtualbox Adapters

![image](https://user-images.githubusercontent.com/100133263/204811594-49ff32e1-9a22-46b4-b83c-379b494dd7c5.png)


## VI commands

    - saving and closing the editor

        :wq

    - NOT saving and closing the editor

        :qa

## Markdown PDF Extension - VSCode
https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf

- export markdown file to pdf

        f1 + Export (pdf)
        or
        rightclick + Export (pdf)

## Package management

- Almalinux

        sudo dnf update
        sudo dnf search [packagename]
        sudo dnf install -y [package name]

- LinuxMint

        sudo apt update
        sudo apt upgrade

        sudo apt search [name]
        sudo apt show [name]
        sudo apt install -y [name]

## Change permissions, Change owner:group

- change permissions

        sudo chmod 777 [bestand]

- change owner:group

        sudo chown root:root [bestand]

## Almalinux taal permanent veranderen

        sudo localetcl set-keymap be


`test`


        
