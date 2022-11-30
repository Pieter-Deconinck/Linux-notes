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

- ip interfaces configuration

        /etc/sysconfig/network-scripts/ifcfg-*

- Static IP example
![image](https://user-images.githubusercontent.com/100133263/204814049-b6358d5f-a297-4e05-851d-81a253f99c3d.png)

- Check DNS service

        RHEL: /etc/resolv.conf
        Fedora, Debian, etc: resolvectl dns

- DHCP example
![image](https://user-images.githubusercontent.com/100133263/204814371-7d4eaa67-77ed-49be-a8d6-48bf09b1516b.png)


        Ping between hosts
        Ping default GW/DNS
        Query DNS(dig,nslookup,getent)

    	

## Extra's

## Virtualbox Adapters

![image](https://user-images.githubusercontent.com/100133263/204811594-49ff32e1-9a22-46b4-b83c-379b494dd7c5.png)


## VI commands

    - saving and closing the editor

        :wq

    - NOT saving and closing the editor

        :qa



        
