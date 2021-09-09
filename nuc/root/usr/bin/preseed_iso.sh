#!/bin/bash
cd /build
# Unpack
mkdir isofiles
#bsdtar -C isofiles/ -xf debian-11.0.0-amd64-netinst.iso
7z x -oisofiles/ $ISOFILE

# insert the preseed
chmod -R +w isofiles/install.amd
gunzip isofiles/install.amd/initrd.gz
echo preseed.cfg | cpio -H newc -o -A -F isofiles/install.amd/initrd
gzip isofiles/install.amd/initrd
chmod -w -R isofiles/install.amd/

cd isofiles
chmod +w md5sum.txt
find -follow -type f ! -name md5sum.txt -print0 | xargs -0 md5sum > md5sum.txt
chmod -w md5sum.txt
cd ..

# Create new iso image
#genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o preseeded-$ISOFILE isofiles
# Make it bootable
#isohybrid preseeded-$ISOFILE

# Or just do this (when -isohybrid-mbr works..)
xorriso -as mkisofs -o preseeded-$ISOFILE -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin -c isolinux/boot.cat -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table isofiles

echo "Moving preseeded file to host"
mv preseeded-$ISOFILE /host/
echo "Done! the file is named '$ISOFILE'"