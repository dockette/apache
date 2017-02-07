FROM dockette/jessie

MAINTAINER Milan Sulc <sulcmil@gmail.com>

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

RUN apt-get update && apt-get update -y && \
    # APACHE ###################################################################
    apt-get install -y apache2 && \
    a2enmod include && \
    a2enmod rewrite && \
    a2enmod proxy_fcgi && \
    rm /etc/apache2/sites-enabled/000-default.conf && \
    # CLEAN UP #################################################################
    apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

VOLUME /srv
WORKDIR /srv

EXPOSE 80
EXPOSE 443

CMD ["apache2ctl", "-D FOREGROUND"]
