
FROM docker.io/centos:7
RUN yum install -y iperf3 epel-release
RUN yum install -y nginx
# Create files with 1k, 10k and 1000k.
RUN for sz in 1 10 1000; do dd if=/dev/zero of=/usr/share/nginx/html/${sz}k bs=1k count=${sz}; done
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 8080
CMD /usr/sbin/nginx

