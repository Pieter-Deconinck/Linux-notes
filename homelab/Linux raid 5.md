07/02/2023

# Creating raid 5 on my homelab

### 1. Intro
### 2. Raid 5: specifications
### 3. Ubuntu server installer: creating the raid
### 4. mdadm: creating the raid 
### 5. Creating filesystem in the raid
### 6. Mounting the raid
### 7. Permanently mounting the raid
### 8. Extra
<br />

# 1. Intro
<br />

For this homelab I used 1x128gb SSD(old) and 3x2TB HHD's, The operating system was installed on
the SSD and then a RAID 5 array was created using the HDD's. This machine will be used for creating
and hosting my own VM's and other projects. The idea is that the SSD with the OS will be easily 
backupable because of its small size and anything on it will be easily recreated. And all the
VM's and project data will be kept on the raid 5 array which provides redundancy.

I created the raid within the ubuntu server installer, then mdadm creates it. once that process is done (it took about 2-3 hours), I gave the raid a file system and then permanently mounted it.

This was all done on Ubuntu server 22.04
  
important note: Raid is not a backup. this isn't used as a backup, just redundancy.

# 2. Raid 5: specifications. 

Raid 5 needs a minimum of 3 drives. it splits the data over all the drives and uses parity for redundancy. this parity is also spread over all the drives. I used 3x2TB HDD'S after creating the raid this leaves me with 4TB usable and 2TB used for parity etc. One drive can fail and the data will still be recovarable. but if 2 fail the data is lost.
<br />
<br />

A1 B1 C1 = data  
p1 p2 p3 = parity data.

![image](https://hardwaresfera.com/wp-content/uploads/2020/06/CONFIGURACION-RAID-5.jpg)

# 3. Ubuntu server installer: creating the raid

I went through the ubuntu server installer. Chose to manually configure storage.
emptied and formatted the 128GB SSD and selected it for the boot drive and OS.

Then I selected the 3x2TB HDD's for raid 5. complete the installer and go to the next step.

# 4. mdadm: creating the raid 

Since the raid was configured in the ubuntu server installer it will automatically start building
itself with mdadm. the specific command used for this would be ``sudo mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3 /dev/sdb /dev/sdc /dev/sdd``

You can check the progress and stats for the raid with ``cat /proc/mdstat`` mine took 2-3 hours to finish.

You can check the partitions and disks with ``sudo lsblk``  
``sudo fdisk -l`` can also provide additional information


# 5. Creating filesystem in the raid

After the raid array was created by mdadm, the next step was giving it a filesystem. For this I used
``sudo mkfs –t ext4 /dev/mdo0``


# 6. Mounting the raid

Now that the raid array has been created and given a filesystem it is essentialy complete and usable. Now in linux it is important to mount your drives, otherwise you won't be able to use them.

First I checked if the raid array was mountable. I created a directory for mounting ``sudo mkdir -p /mount/raid/`` And then attempted to mount the raid array ``sudo mount /dev/md0 /mount/raid`` this was succesfull. I added a test.txt file in the array for later.

# 7. Permanently mounting the raid

Next up is mounting the raid permanently. You could leave it as is but everytime you reboot the server you would have to run the mount command again to mount the raid array. Instead we want it to
mount automatically after each boot.

With normal drives you would check ``blkid`` this gives you the UUID of a drive which you can then
add to ``/etc/fstab`` to mount. But for our RAID5 array this is a bit different. 

Our raid array gets created within ``/etc/mdadm/mdadm.conf`` This will look for the raid drives and
add them together as ``/dev/md0`` my mdadm.conf contains this: 
        
        ARRAY /dev/md0 metadata=1.2 spares=1 name=ubuntu-server:0 UUID=b10ad951:9d6a9a88:d88595b0:be52bbb7  
        MAILADDR root
        

So what I simply ended up doing is adding the name in my ``/etc/fstab`` like this:

        # mounting raid 5 called /dev/md0 created in /etc/mdadm/mdadm.conf  
        /dev/md0 mount/raid ext4 defaults 0 0

 This specifies the drive to mount, the place to mount, the filesystem used, the options, dump support, and automatic check. So now the raid array auto mounts on ``/mount/raid``

# 8. Extra

Usefull links:  
https://www.computernetworkingnotes.com/linux-tutorials/how-to-configure-raid-in-linux-step-by-step-guide.html  
https://www.tutorialspoint.com/how-to-create-a-raid-5-storage-array-with-mdadm-on-ubuntu-16-04  
https://raid.wiki.kernel.org/index.php/A_guide_to_mdadm#Using_the_new_space  
https://linuxhint.com/list_disks_ubuntu/  
https://www.jeffgeerling.com/blog/2021/htgwa-create-raid-array-linux-mdadm  
https://ubuntu.com/server/docs/install/storage  
https://www.digitalocean.com/community/tutorials/how-to-create-raid-arrays-with-mdadm-on-ubuntu-22-04  
http://linux-training.be/sysadmin/ch10.html#idp65224576



