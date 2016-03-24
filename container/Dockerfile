FROM ubuntu:latest

RUN apt-get install -y curl; mkdir -p /etc/apt/sources.list.d/; echo "deb http://pkg.cloudflare.com/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/cloudflare-main.list;  curl -C - https://pkg.cloudflare.com/pubkey.gpg | apt-key add -;  apt-get update; apt-get install -y railgun-stable
ADD startup.sh /bin/
EXPOSE 2408
CMD ["bash", "/bin/startup.sh"]
