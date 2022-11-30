30-11-2022

# HTTPD and Mariadb troubleshooting - Pieter Deconinck

## Bottom-up approach

![image](https://user-images.githubusercontent.com/100133263/204807679-4295cb9a-c274-4ad5-948b-0966f814453f.png)


## Network Access Layer + Physical

- VM
  
        Check Virtual Network Adapters
        Check Cable connected

- IP link 

    ip link
    ip -s link (see statistics)
    ip -s link ls [interface] (see specifc network interface)
    ip link ls up (see all running interfaces)
    
    ip link set [interface] up (enable network interface)
    ip link set [interface] down (disable network interface)

## VI commands

    - saving and closing the editor

        :wq

    - NOT saving and closing the editor

        :qa



        
