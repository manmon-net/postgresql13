#!/bin/bash
if [ ! -d /var/lib/postgresql/data ]
then
  initdb -D /var/lib/postgresql/data --pwfile=<(echo "$POSTGRES_PASSWORD")  
fi
