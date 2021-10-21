#!/bin/bash
echo "Starting container..."
echo "Current user: $(whoami)"
echo "Current user id: $(id -u $(whoami))"

if [ -z "$PULSE_COOKIE_DATA" ]
then
    echo -ne $(echo $PULSE_COOKIE_DATA | sed -e 's/../\\x&/g') >$HOME/pulse.cookie
    export PULSE_COOKIE=$HOME/pulse.cookie
fi

exec "$@"
