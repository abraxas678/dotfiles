#!/bin/bash
BACKEND=$(tailscale status -json | jq -r .BackendState)
SELF=$(tailscale status -json | jq '.Self.Online')

if [[ $BACKEND != "Running" ]] || [[ $SELF != "true" ]]; then
  /home/abrax/tmp/tailscale_setup.sh
fi


