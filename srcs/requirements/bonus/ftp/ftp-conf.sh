useradd hliwa
echo -e "secret\nsecret" | passwd hliwa

sed -i "s/#chroot_list_enable=YES/chroot_list_enable=YES/" /etc/vsftpd.conf
sed -i "s/#chroot_list_file=\/etc\/vsftpd.chroot_list/chroot_list_file=\/etc\/vsftpd.chroot_list/" /etc/vsftpd.conf
echo "chroot_local_user=YES" >> /etc/vsftpd.conf
sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf
sed -i "s/secure_chroot_dir=\/var\/run\/vsftpd\/empty/secure_chroot_dir=\/home\/hliwa/" /etc/vsftpd.conf
echo "pasv_enable=Yes" >> /etc/vsftpd.conf
echo "pasv_min_port=10000" >> /etc/vsftpd.conf
echo "pasv_max_port=10100" >> /etc/vsftpd.conf

echo "hliwa" > /etc/vsftpd.chroot_list

mkdir	/home/hliwa
chown -R hliwa:hliwa /home/hliwa