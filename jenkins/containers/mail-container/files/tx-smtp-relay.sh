#!/bin/sh

SMTP_RELAY_HOST=${SMTP_RELAY_HOST?Missing env var SMTP_RELAY_HOST}
SMTP_RELAY_MYHOSTNAME=${SMTP_RELAY_MYHOSTNAME?Missing env var SMTP_RELAY_MYHOSTNAME}
SMTP_RELAY_USERNAME=${SMTP_RELAY_USERNAME?Missing env var SMTP_RELAY_USERNAME}
SMTP_RELAY_PASSWORD=${SMTP_RELAY_PASSWORD?Missing env var SMTP_RELAY_PASSWORD}

# Port is set to 25 by default unless specifically set
SMTP_RELAY_PORT=${SMTP_RELAY_PORT:-25}

# Put host/port into postconf format
SMTP_RELAY_HOST="[${SMTP_RELAY_HOST}]:${SMTP_RELAY_PORT}"


# handle sasl
echo "${SMTP_RELAY_HOST} ${SMTP_RELAY_USERNAME}:${SMTP_RELAY_PASSWORD}" > /etc/postfix/sasl_passwd || exit 1
postmap /etc/postfix/sasl_passwd || exit 1
rm /etc/postfix/sasl_passwd || exit 1

postconf 'smtp_sasl_auth_enable = yes' || exit 1
postconf 'smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd' || exit 1
postconf 'smtp_sasl_security_options =' || exit 1


# These are required.
postconf "relayhost = ${SMTP_RELAY_HOST}" || exit 1
postconf "myhostname = ${SMTP_RELAY_MYHOSTNAME}" || exit 1

# Override what you want here. The 10. network is for kubernetes
postconf 'mynetworks = 10.0.0.0/8,127.0.0.0/8,172.17.0.0/16,100.64.0.0/10' || exit 1

# http://www.postfix.org/COMPATIBILITY_README.html#smtputf8_enable
postconf 'smtputf8_enable = no' || exit 1

# This makes sure the message id is set. If this is set to no dkim=fail will happen.
postconf 'always_add_missing_headers = yes' || exit 1

# TLS
postconf "smtp_use_tls = yes" || exit 1
postconf "smtp_tls_security_level = encrypt" || exit 1
postconf "smtp_tls_note_starttls_offer = yes" || exit 1
postconf -e 'smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt' || exit 1

/usr/bin/supervisord -n
