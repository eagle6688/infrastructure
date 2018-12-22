#Install dependencies

#1. libtool-ltdl
rpm -qa | grep libtool-ltdl
yum install libtool-ltdl libtool-ltdl-devel -y

#2. gcc
rpm -qa | grep gcc
yum install gcc -y

#3. openssl
rpm -qa | grep openssl
yum install openssl openssl-devel -y