PATCHDATE=$1
OUTP=$2
CURRENTDIR=$3
FILES=${CURRENTDIR}/files
# Magisk start
MAGISKBOOT=${CURRENTDIR}/tools/magiskboot
mkdir ${CURRENTDIR}/bootimg_tmp
cd ${CURRENTDIR}/bootimg_tmp
${MAGISKBOOT} unpack -h ${FILES}/boot.img
sed -i "s:os_patch_level=*:os_patch_level=${PATCHDATE}:g" header
${MAGISKBOOT} repack ${CURRENTDIR}/boot.img
cp -f new-boot.img $OUTP/zip/boot.img
# Magisk end
cp -f ${CURRENTDIR}/files/lib64/libwifi-hal.so $OUTP/libwifi-hal64.so

cd $CURRENTDIR
