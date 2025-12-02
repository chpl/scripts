#!/bin/bash

# Get meeting type from argument
MEETING_TYPE=$1

case "$MEETING_TYPE" in
  "sync")
    MEETING_ID="nvf-jmyv-mvi"
    ;;
  "dev2")
    MEETING_ID="uit-uoxc-nwb"
    ;;
  "product")
    MEETING_ID="kvi-piep-pyn"
    ;;
  "groom")
    MEETING_ID="oar-fory-eob"
    ;;
  *)
    echo "Invalid meeting type. Available options: sync dev2 product groom"
    exit 1
    ;;
esac

open "https://meet.google.com/$MEETING_ID?&authuser=1"
