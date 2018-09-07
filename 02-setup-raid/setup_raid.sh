#!/bin/sh

set -e

DATADISKS=$(lsblk | grep 100G | cut -d' ' -f1 | tr '\n' ' ')
DATADISKSFULLNAMES=""

for DISK in $DATADISKS; do
	DATADISKSFULLNAMES="$DATADISKSFULLNAMES /dev/$DISK"
done

yum install -y mdadm
mdadm --create --verbose /dev/md0 --level=0 --raid-devices=10 $DATADISKSFULLNAMES
mkdir -p /etc/mdadm
mdadm --detail --scan > /etc/mdadm/mdadm.conf

vgcreate sapvg /dev/md0

#Create logical volume group
lvcreate -L 15G -n sapmnt sapvg
lvcreate -L 42G -n usrsap sapvg
lvcreate -L 100G -n sirax sapvg
lvcreate -L 105G -n hanalog sapvg
lvcreate -L 311G -n hanashared sapvg
lvcreate -L 481G -n hanadata sapvg
lvcreate -L 164G -n sapinst sapvg
#Create file system (format)
mkfs.xfs /dev/sapvg/sapmnt
mkfs.xfs /dev/sapvg/usrsap
mkfs.xfs /dev/sapvg/sirax
mkfs.xfs /dev/sapvg/hanalog
mkfs.xfs /dev/sapvg/hanashared
mkfs.xfs /dev/sapvg/hanadata
mkfs.xfs /dev/sapvg/sapinst
#Create maps
mkdir /sapmnt
chmod -R 777 /sapmnt
mkdir /usr/sap
chmod -R 777 /usr/sap
mkdir /SIRAX
chmod -R 777 /SIRAX
mkdir /hana
mkdir /hana/log
chmod -R 777 /hana/log
mkdir /hana/shared
chmod -R 777 /hana/shared
mkdir /hana/data
chmod -R 777 /hana/data
mkdir /mnt/sapinst
chmod -R 777 /mnt/sapinst
#Mount file systems
mount /dev/sapvg/sapmnt /sapmnt
mount /dev/sapvg/usrsap /usr/sap
mount /dev/sapvg/sirax /SIRAX
mount /dev/sapvg/hanalog /hana/log
mount /dev/sapvg/hanashared /hana/shared
mount /dev/sapvg/hanadata /hana/data
mount /dev/sapvg/sapinst /mnt/sapinst
# Adding FSTAB Entrys
echo "# SAP RAID" >> /etc/fstab
echo "/dev/sapvg/sapmnt	    	/sapmnt             xfs     defaults,nofail 0 0" 	>> /etc/fstab
echo "/dev/sapvg/usrsap	    	/usr/sap            xfs     defaults,nofail 0 0" 	>> /etc/fstab
echo "/dev/sapvg/sirax	    	/SIRAX              xfs     defaults,nofail 0 0" 	>> /etc/fstab
echo "/dev/sapvg/hanalog    	/hana/log           xfs     defaults,nofail 0 0" 	>> /etc/fstab
echo "/dev/sapvg/hanashared 	/hana/shared        xfs     defaults,nofail 0 0" 	>> /etc/fstab
echo "/dev/sapvg/hanadata   	/hana/data          xfs     defaults,nofail 0 0" 	>> /etc/fstab
echo "/dev/sapvg/sapinst    	/mnt/sapinst        xfs     defaults,nofail 0 0" 	>> /etc/fstab




