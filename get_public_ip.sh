#!/bin/bash

if [ -z "$ocid_instance" ] 
then
  echo "Error: missing variable definitions"
  exit 1
fi

echo "Public IP of" ${image_name}
oci compute instance list-vnics --instance-id \
    --instance-id ${ocid_instance} --query 'data [0]."public-ip"' \
    --raw-output