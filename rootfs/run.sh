#!/bin/bash

if [ -z "${HC_HASS_API_PASSWORD}" ]; then
    config=${HC_BASEPATH:-/homeassistant}
    export HC_HASS_API_PASSWORD=$(cat "$config/.storage/.hass_token_long")
fi;

exec "$@"