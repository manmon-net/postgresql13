#!/bin/bash
if [ ! -d /var/lib/postgresql/data ]
then
  /usr/lib/postgresql/13/bin/initdb -D /var/lib/postgresql/data --pwfile=<(echo "$POSTGRES_PASSWORD")
  echo "host   all             all                                     md5" >> /var/lib/postgresql/data/pg_hba.conf
  echo "listen_addresses = '*' >> /var/lib/postgresql/data/postgresql.conf
fi

/usr/lib/postgresql/13/bin/postgres -D /var/lib/postgresql/data
