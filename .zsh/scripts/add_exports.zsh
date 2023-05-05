#!/bin/bash


EXPORT_LIST="$HOME/.zsh/export_list.zsh"

if [[ ! -f "$EXPORT_LIST" ]]; then
  touch "$EXPORT_LIST"
fi

for VARNAME in "$@" ; do
 if ! grep -q -F "export $VARNAME" "$EXPORT_LIST" ; then
   echo "export $VARNAME "  >> "$EXPORT_LIST"
 else
  echo "variable already exists"
 fi
done
