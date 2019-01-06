sudo yum install xinetd -y

sudo systemctl enable xinetd
sudo systemctl daemon-reload
sudo systemctl start xinetd
systemctl status xinetd