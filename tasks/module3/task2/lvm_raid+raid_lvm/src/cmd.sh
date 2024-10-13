echo LVM + RAID
mdadm --zero-superblock --force /dev/ram0
mdadm --zero-superblock --force /dev/ram1
mdadm --zero-superblock --force /dev/ram2
mdadm --stop /dev/md0

mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3  /dev/ram0 /dev/ram1 /dev/ram2 

lvremove /dev/vg_over_raid/lv_over_raid -y
vgremove /dev/vg_over_raid -y
pvremove /dev/md0 -y

pvcreate /dev/md0
vgcreate vg_over_raid /dev/md0
lvcreate --zero n -L 4M -n lv_over_raid vg_over_raid

vgchange -a y
vgmknodes
dd if=/dev/zero of=/dev/vg_over_raid/lv_over_raid bs=4k count=1

mkfs.ext4 /dev/vg_over_raid/lv_over_raid

mkdir -p /mnt/files
mount /dev/vg_over_raid/lv_over_raid /mnt/files/


# 
echo RAID + LVM
# 

mdadm --stop /dev/md1
lvremove /dev/myvg/lv1 -y
lvremove /dev/myvg/lv2 -y
vgremove /dev/myvg /dev/ram3 /dev/ram4 /dev/ram5 -y
pvremove /dev/ram3 /dev/ram4 /dev/ram5 -y

pvcreate /dev/ram3 /dev/ram4 /dev/ram5
vgcreate myvg /dev/ram3 /dev/ram4 /dev/ram5
lvcreate --zero n -L 4M -n lv1 myvg
lvcreate --zero n -L 4M -n lv2 myvg

vgchange -a y
vgmknodes

mdadm --zero-superblock --force /dev/myvg/lv1
mdadm --zero-superblock --force /dev/myvg/lv2
mdadm --create --verbose /dev/md1 --level=5 --raid-devices=2  /dev/myvg/lv1 /dev/myvg/lv2

dd if=/dev/zero of=/dev/md1 bs=4k count=1
mkfs.ext4 /dev/md1

mount /dev/md1 /mnt/files/

cp -r ./internal/package ./