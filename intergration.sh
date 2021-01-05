#!/bin/bash
tmp=$(mktemp)
curl -s -H 'Authorization: Bearer <Access Token>'  <Server URL>/api/v4/channels/<Channel ID>/posts | jq '.' > $tmp
lastPost=$(cat $tmp | jq '.order[]' | head -n 1)

#TODO: make sure that the command has not already been run.
cmd=$(echo "cat $tmp | jq '.posts.$lastPost.message'" | bash | sed 's/"//g; s/cmd //')

#echo $tmp
#echo $cmd

#TODO: conferm command


