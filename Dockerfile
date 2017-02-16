FROM alpine:latest

MAINTAINER Cloud Posse, LLC <hello@cloudposse.com>
ENV MYSQL_TUNER_VERSION=1.6.18
RUN apk --update add mysql-client perl curl && \
    rm -rf /var/cache/apk/* 
RUN curl --silent --fail --location https://github.com/major/MySQLTuner-perl/archive/${MYSQL_TUNER_VERSION}.tar.gz | tar -C / -zvx MySQLTuner-perl-${MYSQL_TUNER_VERSION} && \
    mv MySQLTuner-perl-${MYSQL_TUNER_VERSION} mysqltuner

WORKDIR /mysqltuner

ENTRYPOINT [ "/mysqltuner/mysqltuner.pl" ]
