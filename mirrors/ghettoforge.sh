#Adding Postfix 3 mirrors
vi /etc/yum.repos.d/ghettoforge.repo

#Add:
[ghettoforge]
name=Ghettoforge packages that won't overwrite core distro packages.
mirrorlist=http://mirrorlist.ghettoforge.org/el/7/gf/$basearch/mirrorlist
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-gf.el7
failovermethod=priority

[ghettoforge-plus]
name=Ghettoforge packages that will overwrite core distro packages.
mirrorlist=http://mirrorlist.ghettoforge.org/el/7/plus/$basearch/mirrorlist
# Please read http://ghettoforge.org/index.php/Usage *before* enabling this repository!
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-gf.el7
failovermethod=priority

#Exec
yum clean all
yum makecache fast