#Install Berkeley DB

#1. Whether BDB is installed or not?
rpm -qa | grep BDB

#2. Download BDB https://download.oracle.com/otn/berkeley-db/db-18.1.25.tar.gz
#   PSCP.exe D:\Softwares\Databases\db-18.1.25.tar.gz 用户名@Linux的IP:Linux下的目标目录
cd ~/download && ls
tar xfzv db-18.1.25.tar.gz
mv db-18.1.25 bdb

#3. config install properties
mkdir /usr/local/programs
mkdir /usr/local/programs/BDB

cd bdb/build_unix
../dist/configure --prefix=/usr/local/programs/BDB

