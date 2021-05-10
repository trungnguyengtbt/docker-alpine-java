FROM alpine:latest
LABEL maintainer "Trung Nguyen <trungnguyen.gtbt@gmail.com>"

RUN apk add --no-cache openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community