FROM alpine:3.7

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/ddclient", "-foreground"]

RUN apk --no-cache add bash gettext perl perl-json perl-io-socket-ssl perl-io-socket-inet6 perl-netaddr-ip && \
    apk --no-cache add --virtual build-dependencies make perl-utils perl-test-requires && \
    cpan install Data::Validate::IP && \
    rm -rf $HOME/.cpan/ /tmp/cpan* && \
    apk --no-cache del build-dependencies && \
    mkdir -p /etc/ddclient /var/cache/ddclient
COPY ddclient/ddclient /usr/sbin/
COPY entrypoint.sh /
