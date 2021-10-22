FROM python:alpine

RUN mkdir /config
VOLUME ["/config"]

RUN mkdir /usr/local/share/GeoIP

RUN apk add build-base libxml2-dev libxslt-dev curl 

COPY parsedmarc.ini /
COPY install_geoupdate.sh /
COPY start.sh /

RUN chmod 755 /install_geoupdate.sh /start.sh
RUN /install_geoupdate.sh
RUN pip install parsedmarc

CMD ["/start.sh"]

