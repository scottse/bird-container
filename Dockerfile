FROM debian:latest

RUN apt update

RUN apt install -y apt-transport-https ca-certificates wget tcpdump iproute2

RUN wget -O /usr/share/keyrings/cznic-labs-pkg.gpg https://pkg.labs.nic.cz/gpg

RUN echo "deb [signed-by=/usr/share/keyrings/cznic-labs-pkg.gpg] https://pkg.labs.nic.cz/bird3 trixie main" | tee /etc/apt/sources.list.d/cznic-labs-bird3.list

RUN apt update

RUN apt install -y bird3

ENTRYPOINT ["/usr/sbin/bird", "-d"]
