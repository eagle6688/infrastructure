# In order to inspect the mail queue, use one of the following commands:
mailq
sendmail -bp
postqueue -p

# Clear all mails in queue.
postsuper -d ALL

# Log
su
cat /var/log/maillog
grep -n error /var/log/maillog

# Status, running or not?
sudo postfix status

# List port information of all programs.
sudo netstat -ntpl