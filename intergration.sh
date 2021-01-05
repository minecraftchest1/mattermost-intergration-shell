#!/bin/bash
tmp=$(mktemp)
curl -s -H 'Authorization: Bearer hrb9bqqwd7fxje1ihs1hmdj5he'  http://192.168.1.40/api/v4/channels/dtn3fwf5u3bhjfcn6cmyocr7ir/posts | jq '.' > $tmp
lastPost=$(cat $tmp | jq '.order[]' | head -n 1)

#TODO: make sure that the command has not already been run.
cmd=$(echo "cat $tmp | jq '.posts.$lastPost.message'" | bash | sed 's/"//g; s/cmd //')

echo $tmp
echo $cmd

#TODO: conferm command


