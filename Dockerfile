FROM composer:latest as BUILDER

FROM jenkins/jnlp-slave
COPY --from=builder /usr/bin/composer /usr/local/bin/
USER root
RUN apt update \
    && apt install -y \
    php \
    php-gd \
    php-mbstring \
    php-xml
USER jenkins
