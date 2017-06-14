#!/bin/bash

filesForTrash=$(notmuch search --output=files tag:killed | grep -v Trash)
filesToDelete=$(notmuch search --output=files tag:delete)

for file in $filesForTrash; do
  echo "Moving file $file to trash"
  mv $file ~/mail/Trash/cur/
done

for file in $filesToDelete; do
  echo "Deleting file $file"
  rm $file
done

