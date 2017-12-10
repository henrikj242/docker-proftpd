FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y proftpd

ADD proftpd.conf /etc/proftpd/proftpd.conf
RUN sudo chown root:root /etc/proftpd/proftpd.conf
RUN mkdir /ftp && \  
  useradd ftpuser -p password -d /ftp/ftpuser -s /bin/false && \
  echo '/bin/false' >> /etc/shells && \
  chmod 755 /ftp/ftpuser

EXPOSE 21
EXPOSE 20

CMD ["proftpd", "--nodaemon", "-c", "/etc/proftpd/proftpd.conf"]
