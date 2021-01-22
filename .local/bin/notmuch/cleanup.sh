#!/bin/bash

filesForTrash=$(notmuch search --output=files tag:killed | grep -v Trash)
filesToDelete=$(notmuch search --output=files tag:delete)
filesToInbox=$(notmuch search --output=files tag:inbox | grep -v INBOX)
filesForJunk=$(notmuch search --output=files NOT tag:inbox AND NOT tag:killed AND NOT tag:sent AND NOT tag:studium | grep -v Junk)
filesSent=$(notmuch search --output=files tag:sent | grep -v Sent)

for file in $filesForTrash; do
    echo "Moving file $file to trash"
    mv $file ~/mail/Trash/cur/
done

for file in $filesToInbox; do
    echo "Moving file $file to Inbox"
    mv $file ~/mail/INBOX/cur/
done

for file in $filesToDelete; do
    echo "Deleting file $file"
    rm $file
done

for file in $filesForJunk; do
    echo "Moving $file to Junk"
    mv $file ~/mail/Junk/cur/
done

for file in $filesSent; do
    echo "Moving $file to Sent"
    mv $file ~/mail/Sent/cur/
done
