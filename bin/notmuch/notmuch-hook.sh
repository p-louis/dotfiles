#!/bin/bash

notmuch new

# serious stuff
notmuch tag +bike-components -- from:info@bike-components.de
notmuch tag +paypal -- from:@paypal.de or from:@paypal.com
notmuch tag +amazon -- from:@amazon.de or from:@amazon.com
notmuch tag +private +inbox -- from:louis and not tag:sent
notmuch tag +steam -- from:@steampowered.com
notmuch tag +msc -unread -inbox -- from:@msccruises.de
notmuch tag +lotto -- from:info@staatliche-lotterieverwaltung.de
notmuch tag +lieferheld -- from:@lieferheld.de
notmuch tag +komoot -- from:komoot
notmuch tag +espanien -unread -inbox -- from:@espanien.de
notmuch tag +ticket -unread -- from:ticket@swm.de
notmuch tag +soznet -unread -inbox -- from:@linkedin or from:@xing
notmuch tag +studium -- from:@fernuni-hagen.de

# Special Place in hell for those guys
notmuch tag +newsletter -unread -inbox +killed -- from:marketing@weare.de or from:info@solidworks-community.com or from:news@ or from:newsletter@ or from:vfe-campain-response@amazon.de
notmuch tag +facebook -unread -inbox -- from:@facebook
notmuch tag +youtube -unread -- from:@youtube.com
notmuch tag +killed -unread -- from:@fmp.gmx.de or from:@gmxnet.de or from:@mail.verivox.de or from:@engage.vmware.com
notmuch tag +duolingo -unread -inbox -- from:@duolingo.com
notmuch tag -unread -inbox +killed -- from:promotion5@amazon.de or from:riotgames.com or from:@couchsurfing.com or from:@hackerrankmail.com
notmuch tag -unread -inbox +killed -- from:@marketing.ti.com
notmuch tag -unread -inbox -- tag:killed

newMail=$(notmuch search tag:unread | wc -l)
if [[ $newMail -gt 0 ]]; then
  sudo -u caya DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -i emblem-mail "New Mail" "You have $newMail new email"
fi
