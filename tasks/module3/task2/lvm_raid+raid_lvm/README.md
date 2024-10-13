# LVM + RAID
```
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: stopped /dev/md0
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: layout defaults to left-symmetric
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: layout defaults to left-symmetric
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: chunk size defaults to 512K
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: size set to 63488K
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: Fail create md0 when using /sys/module/md_mod/parameters/new_array
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: Defaulting to version 1.2 metadata
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: array /dev/md0 started.
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on lvremove invocation. Parent PID 7: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Logical volume "lv_over_raid" successfully removed
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on vgremove invocation. Parent PID 7: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Volume group "vg_over_raid" successfully removed
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on pvremove invocation. Parent PID 7: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Labels on physical volume "/dev/md0" successfully wiped.
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on pvcreate invocation. Parent PID 7: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Physical volume "/dev/md0" successfully created.
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on vgcreate invocation. Parent PID 7: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Volume group "vg_over_raid" successfully created
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on lvcreate invocation. Parent PID 7: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Logical volume vg_over_raid/lv_over_raid not zeroed.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Logical volume "lv_over_raid" created.
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on vgchange invocation. Parent PID 7: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   1 logical volume(s) in volume group "vg_over_raid" now active
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on vgmknodes invocation. Parent PID 7: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  | 1+0 records in
skillfactory_sys_admin-module3-task2-lvm-raid-1  | 1+0 records out
skillfactory_sys_admin-module3-task2-lvm-raid-1  | 4096 bytes (4.1 kB, 4.0 KiB) copied, 0.000123723 s, 33.1 MB/s
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mke2fs 1.44.1 (24-Mar-2018)
skillfactory_sys_admin-module3-task2-lvm-raid-1  | Creating filesystem with 4096 1k blocks and 1024 inodes
skillfactory_sys_admin-module3-task2-lvm-raid-1  |
skillfactory_sys_admin-module3-task2-lvm-raid-1  | Allocating group tables: done
skillfactory_sys_admin-module3-task2-lvm-raid-1  | Writing inode tables: done
skillfactory_sys_admin-module3-task2-lvm-raid-1  | Creating journal (1024 blocks): done
skillfactory_sys_admin-module3-task2-lvm-raid-1  | Writing superblocks and filesystem accounting information: done
```

# RAID + LVM

```
mdadm: stopped /dev/md1
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on lvremove invocation. Parent PID 8: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Volume group "myvg" not found
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Cannot process volume group myvg
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on lvremove invocation. Parent PID 8: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Volume group "myvg" not found
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Cannot process volume group myvg
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on vgremove invocation. Parent PID 8: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Volume group "myvg" not found
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Cannot process volume group myvg
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Volume group "ram3" not found
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Cannot process volume group ram3
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Volume group "ram4" not found
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Cannot process volume group ram4
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Volume group "ram5" not found
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Cannot process volume group ram5
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on pvremove invocation. Parent PID 8: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Labels on physical volume "/dev/ram3" successfully wiped.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Labels on physical volume "/dev/ram4" successfully wiped.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Labels on physical volume "/dev/ram5" successfully wiped.
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on pvcreate invocation. Parent PID 8: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Physical volume "/dev/ram3" successfully created.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Physical volume "/dev/ram4" successfully created.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Physical volume "/dev/ram5" successfully created.
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on vgcreate invocation. Parent PID 8: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Volume group "myvg" successfully created
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on lvcreate invocation. Parent PID 8: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Logical volume myvg/lv1 not zeroed.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Logical volume "lv1" created.
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on lvcreate invocation. Parent PID 8: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Logical volume myvg/lv2 not zeroed.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   Logical volume "lv2" created.
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on vgchange invocation. Parent PID 8: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   2 logical volume(s) in volume group "myvg" now active
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   1 logical volume(s) in volume group "vg_over_raid" now active
skillfactory_sys_admin-module3-task2-lvm-raid-1  | File descriptor 3 (/task/src/cmd.sh) leaked on vgmknodes invocation. Parent PID 8: /bin/sh
skillfactory_sys_admin-module3-task2-lvm-raid-1  |   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: layout defaults to left-symmetric
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: layout defaults to left-symmetric
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: chunk size defaults to 512K
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: size set to 2048K
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: Fail create md1 when using /sys/module/md_mod/parameters/new_array
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: Defaulting to version 1.2 metadata
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mdadm: array /dev/md1 started.
skillfactory_sys_admin-module3-task2-lvm-raid-1  | 1+0 records in
skillfactory_sys_admin-module3-task2-lvm-raid-1  | 1+0 records out
skillfactory_sys_admin-module3-task2-lvm-raid-1  | 4096 bytes (4.1 kB, 4.0 KiB) copied, 0.000293909 s, 13.9 MB/s
skillfactory_sys_admin-module3-task2-lvm-raid-1  | mke2fs 1.44.1 (24-Mar-2018)
skillfactory_sys_admin-module3-task2-lvm-raid-1  | Creating filesystem with 2048 1k blocks and 256 inodes
skillfactory_sys_admin-module3-task2-lvm-raid-1  | 
skillfactory_sys_admin-module3-task2-lvm-raid-1  | Allocating group tables: done
skillfactory_sys_admin-module3-task2-lvm-raid-1  | Writing inode tables: done
skillfactory_sys_admin-module3-task2-lvm-raid-1  | Creating journal (1024 blocks): done
skillfactory_sys_admin-module3-task2-lvm-raid-1  | Writing superblocks and filesystem accounting information: done
```