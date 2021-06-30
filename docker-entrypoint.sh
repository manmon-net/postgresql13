#!/bin/bash
if [ ! -d /var/lib/postgresql/data ]
then
  /usr/lib/postgresql/13/bin/initdb -D /var/lib/postgresql/data --pwfile=<(echo "$POSTGRES_PASSWORD")  
fi
