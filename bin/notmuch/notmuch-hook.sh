#!/bin/bash

notmuch new

newMail=$(notmuch search tag:unread | wc -l)
if [[ $newMail -gt 0 ]]; then
  sudo -u caya DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -i emblem-mail "New Mail" "You have $newMail new email"
fi

# serious stuff
notmuch tag +bike-components -- from:info@bike-components.de
notmuch tag +paypal -- from:@paypal.de or from:@paypal.com
notmuch tag +amazon -- from:@amazon.de or from:@amazon.com
notmuch tag +private +inbox -- from:louis and not tag:sent
notmuch tag +steam -- from:@steampowered.com
notmuch tag +msc -- from:@msccruises.de
notmuch tag +lotto -- from:info@staatliche-lotterieverwaltung.de
notmuch tag +lieferheld -- from:@lieferheld.de
notmuch tag +komoot -- from:komoot
notmuch tag +espanien -- from:@espanien.de
notmuch tag +ticket -- from:ticket@swm.de
notmuch tag +soznet -unread -- from:@linkedin or from:@xing

# Special Place in hell for those guys
notmuch tag +newsletter -unread -inbox +killed -- from:marketing@weare.de or from:info@solidworks-community.com or from:news@ or from:newsletter@
notmuch tag +facebook -unread -- from:@facebook
notmuch tag +youtube -unread -- from:@youtube.com
notmuch tag -unread -- tag:killed


