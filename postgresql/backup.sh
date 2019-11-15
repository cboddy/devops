#!/bin/bash
#
# backup.sh [host] [database_name] [user_name]
#
# NB: output in /tmp/[database_name].sql.gz is gzipped
#
# to skip the password prompt name user_name a  trusted role in pg_hba.conf
#
host=$1
database_name=$2
user_name=$3

pg_dump -h $host -U $user_name $database_name | gzip > /tmp/$database_name.sql.gz

