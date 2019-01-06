#Download packages -- Not work.

#https://centos.pkgs.org/7/ghettoforge-testing-x86_64/postfix3-3.3.2-1.gf.el7.x86_64.rpm.html
wget http://mirror.ghettoforge.org/distributions/gf/el/7/testing/x86_64//postfix3-ldap-3.3.0-1.gf.el7.x86_64.rpm

#https://centos.pkgs.org/7/ghettoforge-testing-x86_64/postfix3-ldap-3.3.2-1.gf.el7.x86_64.rpm.html
wget http://mirror.ghettoforge.org/distributions/gf/el/7/testing/x86_64//postfix3-3.3.2-1.gf.el7.x86_64.rpm

#Install
rpm -ivh postfix3-ldap-3.3.0-1.gf.el7.x86_64.rpm
rpm -ivh postfix3-3.3.2-1.gf.el7.x86_64.rpm