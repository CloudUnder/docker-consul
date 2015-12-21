FROM alpine:3.2

MAINTAINER Cloud Under "hi@cloudunder.io"

RUN apk --update add ca-certificates

RUN mkdir /config /data /var/consul-ui && \
	wget -O /tmp/consul.zip https://releases.hashicorp.com/consul/0.6.0/consul_0.6.0_linux_amd64.zip && \
	unzip /tmp/consul.zip -d /bin && \
	rm /tmp/consul.zip && \
	wget -O /tmp/consul-ui.zip https://releases.hashicorp.com/consul/0.6.0/consul_0.6.0_web_ui.zip && \
	unzip /tmp/consul-ui.zip -d /var/consul-ui && \
	rm /tmp/consul-ui.zip

COPY default.json /config/default.json

VOLUME ["/config", "/data"]

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp

ENTRYPOINT ["/bin/consul"]
