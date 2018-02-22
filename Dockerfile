FROM golang:1.10

WORKDIR /go/src/github.com/patrickjahns/devldap/

ADD src /go/src/github.com/patrickjahns/devldap/

RUN go get \
  && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o devldap .

FROM alpine:latest

LABEL maintainer="Patrick Jahns <docker@patrickjahns.de" \
  org.label-schema.name="devldap" \
  org.label-schema.schema-version="1.0"

RUN apk --no-cache add ca-certificates

WORKDIR /

COPY --from=0 /go/src/github.com/patrickjahns/devldap/devldap /usr/local/sbin/devldap

COPY data.json /data.json

EXPOSE 389
ENTRYPOINT ["devldap"]
CMD ["-l", "0.0.0.0:389"]