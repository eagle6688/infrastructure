#Configuration /etc/postfix/main.cf and /etc/postfix/master.cf

#Creat ldap-aliases.cf
vi /etc/postfix/ldap-aliases.cf

#Update alias_maps to use ldap
sudo postconf alias_maps=hash:/etc/aliases,ldap:/etc/postfix/ldap-aliases.cf
sudo postfix reload
postconf alias_maps

#Search from ldap server for test.
postmap -q aldwin ldap:/etc/postfix/ldap-aliases.cf

#Comment out 'smtp inet' config item
cd /etc/postfix
vi master.cf

#Check myhostname, host name for mail server.
sudo postconf myhostname=mail.lionlea.com
sudo postfix reload
postconf myhostname

#Check mydomain, $myorigin should use this parameter.
sudo postconf mydomain=lionlea.com
sudo postfix reload
postconf mydomain

#Send mail as "user@$myorigin"
sudo postconf myorigin='$mydomain'
sudo postfix reload
postconf myorigin

#Receive mail as format "user@$mydestination"
sudo postconf mydestination='$myhostname, localhost.$mydomain, localhost, $mydomain'
sudo postfix reload
postconf mydestination

#If you're behind a firewall, you should set up a relayhost.
sudo postconf relayhost='[mail.$mydomain]'
sudo postfix reload
postconf relayhost

#Disable dns lookups.
sudo postconf disable_dns_lookups=yes
sudo postfix reload
postconf disable_dns_lookups

#Set home_mailbox
sudo postconf home_mailbox=Maildir/
sudo postfix reload
postconf home_mailbox

#If your machine is on an open network then you must specify what client IP addresses are authorized to relay their mail through your machine into the Internet.
sudo postconf mynetworks='127.0.0.0/8 192.168.31.0/224'
sudo postfix reload
postconf mynetworks

#If your machine is on an open network then you must also specify whether Postfix will forward mail from strangers.
postconf relay_domains

#Test
telnet 127.0.0.1 25