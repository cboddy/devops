#!/bin/bash
#
# Create a new role with an encrypted password and a database
# *run as root*
# 
# Allow that user to login from anwhere 
#
# ./setup_schema.sh user_name user_password database_name
#

f_sql=$(mktemp)
cat << EOF > $f_sql
CREATE ROLE $1 WITH CREATEDB ENCRYPTED PASSWORD '$2';
CREATE DATABASE $3 WITH OWNER $1;
EOF
chmod a+r $f_sql

teardown() {
    rm -f $f_sql
}
trap teardown EXIT SIGINT
su postgres -c "psql < $f_sql"


POSTGRESQL_CONF_DIR=/etc/postgresql/9.6/main
#AUTH=scram-sha-256
AUTH=md5
echo "host $3 $1 0.0.0.0/0 $AUTH" >> $POSTGRESQL_CONF_DIR/pg_hba.conf

teardown
