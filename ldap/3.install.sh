#Install LDAP

#1. Whether LDAP is installed or not?
rpm -qa | grep openldap

sudo yum remove compat-openldap -y
sudo yum remove openldap-devel -y
sudo yum remove openldap-clients -y
sudo yum remove openldap-servers -y
sudo yum remove openldap -y

#2. Install
yum install openldap openldap-servers openldap-clients openldap-devel compat-openldap -y

#3. Init configuration
#   Whether existed or not?
cat /etc/openldap/ldap.conf

#   Whether existed or not?
cat /var/lib/ldap/DB_CONFIG

#   Init if not existed.
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG

#4. Auth
sudo chown -R ldap.ldap /etc/openldap
sudo chown -R ldap.ldap /var/lib/ldap

rpm -ql openldap-servers | egrep -i '(slapd\.conf\.*|DB_CONFIG.example)'

#5. Config
# Update base and url
sudo vi /etc/openldap/ldap.conf

su
cd /etc/openldap/slapd.d
cat cn=config.ldif

cd /etc/openldap/slapd.d/cn=config

#Update rootdn rootDn.ldif

# Log log.ldif
cat cn\=config.ldif | grep olcLogLevel

# Include schema
rpm -ql sudo-1.8.23 | grep -i schema
ldapadd -Q -Y EXTERNAL -H ldapi:/// -W -f /etc/openldap/schema/cosine.ldif
ldapadd -Q -Y EXTERNAL -H ldapi:/// -W -f /etc/openldap/schema/inetorgperson.ldif
ldapadd -Q -Y EXTERNAL -H ldapi:/// -W -f /etc/openldap/schema/misc.ldif
ldapadd -Q -Y EXTERNAL -H ldapi:/// -W -f /etc/openldap/schema/nis.ldif
ldapadd -Q -Y EXTERNAL -H ldapi:/// -W -f /etc/openldap/schema/openldap.ldif

# Database directory
cd /var/lib/ldap

#6. Open port
sudo firewall-cmd --zone=public --add-port=389/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

#7. Start
sudo systemctl enable slapd.service
sudo systemctl daemon-reload

sudo systemctl start slapd.service
systemctl status slapd.service

#8. Add lib file
cat >> /etc/ld.so.conf.d/ldap.conf << EOF
/usr/lib64/openldap
EOF

ldconfig -v

#6. Add head file
ln -sv /usr/local/programs/BDB/include /usr/include/bdb

# Verify
ldapsearch -x -b '' -s base '(objectclass=*)' namingContexts

# Other
ldapsearch -x -LLL