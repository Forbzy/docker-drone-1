FROM alpine:3.4

RUN apk upgrade --no-cache && apk add --no-cache bash curl ca-certificates
RUN curl -s https://raw.githubusercontent.com/UKHomeOffice/dsp-root-ca/master/root-ca.pem > /usr/local/share/ca-certificates/dsp_root_ca.crt && \
    curl -s https://raw.githubusercontent.com/UKHomeOffice/dsp-root-ca/master/intermediate-ca.pem > /usr/local/share/ca-certificates/dsp_intermediate_ca.crt && \
    update-ca-certificates && \
    curl -s http://downloads.drone.io/release/linux/amd64/drone.tar.gz | tar -C /usr/local/bin -zx

ENTRYPOINT ["/usr/local/bin/drone"]
