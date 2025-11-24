#!/bin/sh
set -e

node migrate.js

# Bind to all interfaces (IPv4 + IPv6) for Fly.io internal networking
# Next.js standalone uses HOSTNAME env var for binding
# [::] = IPv6 wildcard (includes IPv4 via dual-stack)
export HOSTNAME="::"

exec node server.js