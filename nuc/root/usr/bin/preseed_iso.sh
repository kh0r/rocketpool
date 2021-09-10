#!/bin/bash
cd /build

# Unpack
mkdir isofiles
7z x -oisofiles/ $ISOFILE

# Insert the preseed
chmod -R +w isofiles/install.amd
gunzip isofiles/install.amd/initrd.gz
echo preseed.cfg | cpio -H newc -o -A -F isofiles/install.amd/initrd
gzip isofiles/install.amd/initrd
chmod -w -R isofiles/install.amd/

# Regenerate the md5sum
cd isofiles
chmod +w md5sum.txt
find -follow -type f ! -name md5sum.txt -print0 | xargs -0 md5sum > md5sum.txt
chmod -w md5sum.txt
cd ..

# Create new iso image
xorriso -as mkisofs -o preseeded-$ISOFILE -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin -c isolinux/boot.cat -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table isofiles

# Clean up
rm -rf isofiles

echo "Moving preseeded file to host"
mv preseeded-$ISOFILE /host/
echo "Done! the file is named '$ISOFILE'"