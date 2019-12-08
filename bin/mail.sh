#!/bin/bash
#
# Download and index new mail.
#
# Copyright (c) 2017 Patrick Totzke
# Dependencies: flock, nm-online, mbsync, notmuch, afew
# Example crontab entry:
#
#   */2 * * * * /usr/bin/flock -n /home/pazz/.pullmail.lock /home/pazz/bin/pullmail.sh > /home/pazz/.pullmail.log
# 

PATH=/home/patrick/.local/bin:/usr/local/bin/:$PATH
ACCOUNTDIR=/home/patrick/mail/

# this makes the keyring daemon accessible
function keyring-control() {
        local -a vars=( \
                DBUS_SESSION_BUS_ADDRESS \
                GNOME_KEYRING_CONTROL \
                GNOME_KEYRING_PID \
                XDG_SESSION_COOKIE \
                GPG_AGENT_INFO \
                SSH_AUTH_SOCK \
        )
        local pid=$(ps -C i3 -o pid --no-heading)
        eval "unset ${vars[@]}; $(printf "export %s;" $(sed 's/\x00/\n/g' /proc/${pid//[^0-9]/}/environ | grep $(printf -- "-e ^%s= " "${vars[@]}")) )"
}

function log() { 
    notify-send -t 2000  'mail sync:' "$@"
}

function die() { 
    notify-send -t 2000 -u critical 'mail sync:' "$@"
    exit 1
}



# Let's Do stuff
#keyring-control

# abort as soon as something fails
set -e


echo ---------------------------------------------------------
date

offlineimap

# index and tag new mails
echo ------------------------ NOTMUCH ------------------------
notmuch new 2>/dev/null || die "NOTMUCH new failed"

echo ------------------------  AFEW   ------------------------
afew -v --tag --new || die "AFEW died"

echo ---------------------------------------------------------
echo "all done, goodbye."
