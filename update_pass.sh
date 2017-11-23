#!/bin/bash

# We need to create basic config files if none exists.  This happens
# if an external volume is defined.

if [ ! -e /etc/bind/named.conf ]; then
  cp /root/named/* /etc/bind/ 
fi

# The bind directory need to be owned by the bind user
chown bind: /etc/bind/*
chown bind: /etc/bind/
chown bind: /var/lib/bind/*
chown bind: /var/lib/bind/
