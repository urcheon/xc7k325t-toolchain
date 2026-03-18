#!/bin/bash
# entrypoint.sh
if ! whoami &>/dev/null; then
    export NSS_WRAPPER_PASSWD=/tmp/passwd
    export NSS_WRAPPER_GROUP=/tmp/group
    echo "user:x:$(id -u):$(id -g):user:/home/user:/bin/bash" > /tmp/passwd
    echo "user:x:$(id -g):" > /tmp/group
    export LD_PRELOAD=libnss_wrapper.so
fi
exec "$@"