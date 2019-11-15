# postgres notes
# [install.sh](#install.sh)
* debian install
* my rpi installs 9.6 but we should use 10+ for scram-sha-256 password auth!

# systemd service management 
sudo  service postgresql [restart|stop|start]

# config 
/etc/postgresql/9.6/main/
/etc/postgresql/9.6/main/postgresql.conf


# [client authentication](https://www.postgresql.org/docs/current/auth-pg-hba-conf.html)
# password_encryption = 'scram-sha-256'

# backup
* [file-level](https://www.postgresql.org/docs/11/backup-file.html): requires server downtime
* pg_dump: backup.sh
* [base-backup](https://www.postgresql.org/docs/11/app-pgbasebackup.html)
* base-backup + WAL
