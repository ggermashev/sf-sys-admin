gpg2 --export -a "grigorii germashev rpm" > ./RPM-GPG-KEY-Grigorii-Germashev
echo "%_signature gpg" >> /root/.rpmmacros
echo "%_gpg_name grigorii germashev rpm" >> /root/.rpmmacros
echo "%_gpg_passphrase qwe" >> /root/.rpmmacros
echo addsign...
rpm --addsign /root/rpmbuild/RPMS/x86_64/script1-1.0-1.fc37.x86_64.rpm
echo import key...
sudo rpm --import ./RPM-GPG-KEY-Grigorii-Germashev
echo check key...
rpm --checksig /root/rpmbuild/RPMS/x86_64/script1-1.0-1.fc37.x86_64.rpm > check-key-result

cp ./RPM-GPG-KEY-Grigorii-Germashev /task/package/RPM-GPG-KEY-Grigorii-Germashev
cp /root/rpmbuild/RPMS/x86_64/script1-1.0-1.fc37.x86_64.rpm /task/package/script1-1.0-1.fc37.x86_64.rpm
cp ./check-key-result /task/package/check-key-result 
script1 > /task/package/script-answer