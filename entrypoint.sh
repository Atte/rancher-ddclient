#!/bin/bash
set -eu

config_fname='/etc/ddclient/ddclient.conf'
envsubst <<<"$DDCLIENT_CONFIG" >"$config_fname"
chmod go-rwx "$config_fname"
exec "$@"
