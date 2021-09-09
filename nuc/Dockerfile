FROM debian
RUN apt-get update
RUN apt-get install p7zip-full cpio syslinux-utils genisoimage xorriso curl isolinux -y

ENV ISOFILE="debian-11.0.0-amd64-netinst.iso"
WORKDIR /build
RUN curl -LO https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/$ISOFILE

COPY root/ /

CMD preseed_iso.sh