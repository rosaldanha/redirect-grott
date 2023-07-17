FROM alpine:latest
COPY ./run.sh /
RUN apk update
RUN apk add iptables
RUN apk add busybox-extras
RUN chmod +x /run.sh
EXPOSE 5279
WORKDIR /


CMD [ "/run.sh" ]
