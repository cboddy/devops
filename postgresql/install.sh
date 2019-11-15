#!/bin/bash
# [install postgres](https://wiki.debian.org/PostgreSql)
apt update
apt install -y postgresql postgresql-client 

# the default database user and default database are called postgres

# install pgcli
#apt-install libpq-dev python-dev
#pip install pgcli
apt-install pgcli

# make it listen on all NICs
POSTGRESQL_CONF_DIR=/etc/postgresql/9.6/main
echo "listen_addresses = '*'" >> $POSTGRESQL_CONF_DIR/postgresql.conf

# restart
sudo service postgresql restart
