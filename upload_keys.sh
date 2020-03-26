#!/bin/bash

if [ -z "$os_namespace" ] || [ -z "$bucket_name" ] || [ -z "$ocid_comp}" ]
then
  echo "Error: missing variable definitions"
  exit 1
fi

oci os bucket create --namespace ${os_namespace} --name ${bucket_name} --compartment-id $ocid_comp
oci os object put -bn ${bucket_name} --file ${private_key}
oci os object put -bn ${bucket_name} --file ${public_key}
preauth_private=$(oci os preauth-request create --access-type ObjectRead \ 
    -bn ${bucket_name} --name Keys \
    --time-expires date --date=`'tomorrow' +%Y-%m-%d` \
    -on id_rsa \
    --query 'data[0]."access-uri"')
preauth_public=$(oci os preauth-request create --access-type ObjectRead \
    -bn ${bucket_name} --name Keys --time-expires \
    `date --date=`'tomorrow' +%Y-%m-%d` \
    -on id_rsa.pub \
    --query 'data[0]."access-uri")

# Need id for deletion
# --query 'data[?contains("display-name", `'"${image_name}"'`)].join('"'"' '"'"', ["listing-id", "display-name"]) | join(`\n`, @)' \
#  ; read ocid_listing display_name <<< "${pic_listing}"