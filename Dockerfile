FROM multiarch/qemu-user-static:x86_64-aarch64 as qemu
FROM arm64v8/ubuntu:20.04

COPY --from=qemu /usr/bin/qemu-aarch64-static /usr/bin

FROM alpine:latest
MAINTAINER Emmanuel Tychon

RUN apk --no-cache add x11vnc ttf-liberation ttf-dejavu firefox-esr terminus-font xvfb openbox xfce4-terminal supervisor sudo \
&& addgroup alpine \
&& adduser  -G alpine -s /bin/sh -D alpine \
&& echo "alpine:alpine" | /usr/sbin/chpasswd \
&& echo "alpine    ALL=(ALL) ALL" >> /etc/sudoers
ADD etc /etc
WORKDIR /home/alpine
EXPOSE 5900
USER alpine
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
