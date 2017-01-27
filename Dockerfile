FROM alpine:3.3

RUN \
  apk add wget ca-certificates --update-cache && \
  wget -q -O testlink-1.9.zip https://github.com/TestLinkOpenSourceTRMS/testlink-code/archive/testlink_1_9.zip && \
  unzip testlink-1.9.zip && \
  rm -f testlink-1.9.zip && \
  mkdir -p /var && \
  mv testlink-* /var/testlink && \
  rm -rf testlink* && \
  chmod 777 -R /var/testlink/gui/templates_c && \
  mkdir -p /var/testlink/logs && \
  mkdir -p /var/testlink/upload_area && \
  chmod 777 -R /var/testlink/logs && \
  chmod 777 -R /var/testlink/upload_area

ADD *.php /var/testlink/

ENTRYPOINT tail -f /dev/null

VOLUME /var/testlink /var/testlink/upload_area /var/testlink/logs
