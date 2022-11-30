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
    	

## Extra's

## Virtualbox Adapters

## VI commands

    - saving and closing the editor

        :wq

    - NOT saving and closing the editor

        :qa



        
