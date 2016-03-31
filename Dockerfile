#FROM rancher/confd-base:0.11.0-dev-rancher
FROM ubuntu
RUN apt-get update && apt-get install -y curl wget vim jq unzip psmisc
ADD https://github.com/kelseyhightower/confd/releases/download/v0.12.0-alpha3/confd-0.12.0-alpha3-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

ADD ./conf.d /etc/confd/conf.d
ADD ./templates /etc/confd/templates

ENTRYPOINT ["/usr/local/bin/confd"]
CMD ["--backend", "rancher", "--prefix", "/2015-07-25", "--log-level", "debug"]
