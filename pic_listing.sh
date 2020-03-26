#!/bin/bash

if [ -z "$image_name"] 
then
  echo "Error: missing variable definitions"
  exit 1
fi

pic_listing=$(oci compute pic listing list \
--all \
--query 'data[?contains("display-name", `'"${image_name}"'`)].join('"'"' '"'"', ["listing-id", "display-name"]) | join(`\n`, @)' \
--raw-output) ; read ocid_listing display_name <<< "${pic_listing}"; echo ${pic_listing}
