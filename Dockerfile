FROM gliderlabs/alpine:latest
MAINTAINER ntk1000

ENV VERSION=0.11.5

# RUN apk add --no-cache curl

ADD https://github.com/coreos/fleet/releases/download/v${VERSION}/fleet-v${VERSION}-linux-amd64.tar.gz /tmp/fleet.tar.gz

RUN cd /bin \
	&& tar zxvf /tmp/fleet.tar.gz \
	&& mv ./fleet-v${VERSION}-linux-amd64/* ./ \
	&& chmod +x /bin/fleetctl \
	&& rm /tmp/fleet.tar.gz \
	&& rm -rf ./fleet-v${VERSION}-linux-amd64

ENTRYPOINT ["/bin/fleetctl"]
