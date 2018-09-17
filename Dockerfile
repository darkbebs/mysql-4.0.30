FROM alpine:2.6
MAINTAINER Dark <big.dark@gmail.com>

ENV MYSQL_VER="4.0.30" WORK_DIR="/usr/local/src"
ADD mysql-${MYSQL_VER}.tar.gz ${WORK_DIR}/
COPY my.cnf /etc/my.cnf

RUN set -x ; \
    apk update && apk add --update gcc g++ make tar ncurses-dev bison libtool readline-dev tzdata file &&\
    rm -rf /var/cache/apk/* &&\
    cd ${WORK_DIR} &&\
    cd mysql-${MYSQL_VER} &&\
    ./configure --without-debug --enable-thread-safe-client --with-big-tables --with-named-thread-libs="-lpthread" &&\
    make &&\
    make install &&\
    mkdir -p /var/db/mysql/tmp/ &&\
    mkdir -p /var/log/mysql/ &&\
    chown mysql:mysql -R /var/db/mysql/ &&\
    chown mysql:mysql -R /var/log/mysql &&\
    # chown -R root  . &&\
    # # Timezone Setting
    cp -p /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

VOLUME /var/db/mysql/

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld_safe"]
