#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

export LESS="-SRF"
pgcli "postgres://postgres:password@127.0.0.1:$(docker compose port postgres 5432 | cut -d ":" -f2)/postgres"
