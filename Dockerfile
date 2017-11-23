# Bind
#
# A simple name server.

FROM phusion/baseimage:0.9.22
# MAINTAINER CosmicQ <cosmicq@cosmicegg.net>

ENV HOME /root
ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8

RUN ln -s -f /bin/true /usr/bin/chfn

# Install packages
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install bind9

ADD start_named.sh /etc/service/named/run
ADD update_pass.sh /etc/my_init.d/01_update_pass.sh
ADD named.tar.gz /root/named

EXPOSE 53
VOLUME ["/etc/bind","/var/lib/bind"]

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
