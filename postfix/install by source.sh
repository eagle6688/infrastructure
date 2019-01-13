#1. Install dependency
sudo yum install -y m4
m4 --version

#2. Download
wget http://cdn.postfix.johnriley.me/mirrors/postfix-release/official/postfix-3.3.2.tar.gz

#3. Decompress
tar -zxvf postfix-3.3.2.tar.gz
cd postfix-3.3.2

#4. Config
make makefiles CCARGS="-DHAS_LDAP -I/usr/include -DHAS_DB -I/usr/include/bdb" AUXLIBS_LDAP="-L/usr/lib64/openldap -lldap -L/usr/lib64/openldap -llber -L/usr/local/programs/BDB/lib -ldb"

#5. Complie
make

#6. Install
sudo make install

#7. Create group and users

#Add postfix group
grep -n postfix: /etc/group
groupadd -g 89 postfix

#Add postfix user
id postfix
useradd -g postfix -u 89 -s /sbin/nologin -M postfix

#Add mail group
grep -n mail: /etc/group
groupadd -g 12 mail -u 89

#Add mail user
id mail
useradd -g mail -u 8 -s /sbin/nologin -d /var/spool/mail -M mail

#Add postdrop group
grep -n postdrop /etc/group
groupadd -g 90 postdrop

#Add postdrop user
id postdrop
useradd -g postdrop -u 90 -s /sbin/nologin -M postdrop

#8. Start
sudo postfix start

#9. Open port
sudo firewall-cmd --zone=public --add-port=25/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports