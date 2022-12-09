#!/usr/bin/env sh

# graceful exit: based on https://unix.stackexchange.com/a/42292
cleanup () {
    echo "Exiting..."
    exit 0
}

trap cleanup SIGINT SIGTERM

echo "Starting smtp-sink daemon..."
smtp-sink -d '/tmp/mail/mail_%Y-%m-%d_%H-%M-%S_' -u 'postfix' -v 0.0.0.0:25 100 &

# in infinite loop
while true; do
    # add .eml extension to non .eml files
    find /tmp/mail/ -type f -not -name "*.*" -print0 | xargs -I % mv % %.eml
    sleep 2
done
