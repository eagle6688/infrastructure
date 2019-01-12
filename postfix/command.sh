# In order to inspect the mail queue, use one of the following commands:
mailq
sendmail -bp
postqueue -p

# Clear all mails in queue.
postsuper -d ALL

# Log
su
sudo cat /var/log/maillog
grep -n error /var/log/maillog

# See the log
egrep '(reject|warning|error|fatal|panic):' /var/log/maillog

# Status, running or not?
sudo postfix status

# List port information of all programs.
sudo netstat -ntpl