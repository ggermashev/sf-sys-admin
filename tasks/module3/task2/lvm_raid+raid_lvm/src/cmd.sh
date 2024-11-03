echo LVM + RAID
mdadm --zero-superblock --force /dev/ram0
mdadm --zero-superblock --force /dev/ram1
mdadm --zero-superblock --force /dev/ram2
mdadm --stop /dev/md0

echo 'RAID'
echo 'mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3  /dev/ram0 /dev/ram1 /dev/ram2 '
mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3  /dev/ram0 /dev/ram1 /dev/ram2 
echo 'end RAID'

lvremove /dev/vg_over_raid/lv_over_raid -y
vgremove /dev/vg_over_raid -y
pvremove /dev/md0 -y

echo 'LVM'
echo 'pvcreate /dev/md0'
pvcreate /dev/md0
echo 'vgcreate vg_over_raid /dev/md0'
vgcreate vg_over_raid /dev/md0
echo 'lvcreate --zero n -L 4M -n lv_over_raid vg_over_raid'
lvcreate --zero n -L 4M -n lv_over_raid vg_over_raid
echo 'vgchange -a y'
vgchange -a y
echo 'vgmknodes'
vgmknodes
echo 'end LVM'


echo 'Mount'
echo 'dd if=/dev/zero of=/dev/vg_over_raid/lv_over_raid bs=4k count=1'
dd if=/dev/zero of=/dev/vg_over_raid/lv_over_raid bs=4k count=1
echo 'mkfs.ext4 /dev/vg_over_raid/lv_over_raid'
mkfs.ext4 /dev/vg_over_raid/lv_over_raid
echo 'mkdir -p /mnt/files'
mkdir -p /mnt/files
echo 'mount /dev/vg_over_raid/lv_over_raid /mnt/files/'
mount /dev/vg_over_raid/lv_over_raid /mnt/files/
echo 'end Mount'


# 
echo RAID + LVM
# 

mdadm --stop /dev/md1
lvremove /dev/myvg/lv1 -y
lvremove /dev/myvg/lv2 -y
vgremove /dev/myvg /dev/ram3 /dev/ram4 /dev/ram5 -y
pvremove /dev/ram3 /dev/ram4 /dev/ram5 -y

echo 'LVM'
echo 'pvcreate /dev/ram3 /dev/ram4 /dev/ram5'
pvcreate /dev/ram3 /dev/ram4 /dev/ram5
echo 'vgcreate myvg /dev/ram3 /dev/ram4 /dev/ram5'
vgcreate myvg /dev/ram3 /dev/ram4 /dev/ram5
echo 'lvcreate --zero n -L 4M -n lv1 myvg'
lvcreate --zero n -L 4M -n lv1 myvg
echo 'lvcreate --zero n -L 4M -n lv2 myvg'
lvcreate --zero n -L 4M -n lv2 myvg
echo 'vgchange -a y'
vgchange -a y
echo 'vgmknodes'
vgmknodes
echo 'end LVM'


echo 'RAID'
echo 'mdadm --zero-superblock --force /dev/myvg/lv1'
mdadm --zero-superblock --force /dev/myvg/lv1
echo 'mdadm --zero-superblock --force /dev/myvg/lv2'
mdadm --zero-superblock --force /dev/myvg/lv2
echo 'mdadm --create --verbose /dev/md1 --level=5 --raid-devices=2  /dev/myvg/lv1 /dev/myvg/lv2'
mdadm --create --verbose /dev/md1 --level=5 --raid-devices=2  /dev/myvg/lv1 /dev/myvg/lv2
echo 'end RAID'

echo 'Mount'
echo 'dd if=/dev/zero of=/dev/md1 bs=4k count=1'
dd if=/dev/zero of=/dev/md1 bs=4k count=1
echo 'mkfs.ext4 /dev/md1'
mkfs.ext4 /dev/md1
echo 'mount /dev/md1 /mnt/files/'
mount /dev/md1 /mnt/files/
echo 'end Mount'

cp -r ./internal/package ./