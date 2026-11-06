FROM debian:latest

RUN apt update

RUN apt install -y apt-transport-https ca-certificates wget tcpdump iproute2 bird3

RUN mkdir /run/bird;chown bird:bird /run/bird; chmod 755 /run/bird

ENTRYPOINT ["/usr/sbin/bird", "-d"]
