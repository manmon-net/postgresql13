FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y update  && DEBIAN_FRONTEND=noninteractive apt-get -y install wget gnupg2 && apt-get clean
RUN echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  DEBIAN_FRONTEND=noninteractive apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql && \
  DEBIAN_FRONTEND=noninteractive apt-get clean
  
COPY docker-entrypoint.sh /usr/local/bin/
USER postgres
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 5432
CMD ["/usr/lib/postgresql/13/bin/postgres","-D","/var/lib/postgresql/data"]
