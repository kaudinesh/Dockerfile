FROM centos:7
RUN cd /tmp
RUN curl -LO https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
RUN sha256sum  go1.7*.tar.gz
RUN tar -C /usr/local -xvzf go1.7.linux-amd64.tar.gz
RUN mkdir -p /projects/{bin,pkg,src}
COPY ./hello.go /projects/src
EXPOSE 8081
RUN mkdir /var/log/supervisor/
RUN touch /var/log/supervisor/supervisord.log
WORKDIR /
CMD /usr/local/go/bin/go run /projects/src/hello.go
