#!/bin/bash

if [ -z "$ocid_instance" ] 
then
  echo "Error: missing variable definitions"
  exit 1
fi

oci compute instance list-vnics --instance-id oci compute instance list-vnics \
    --instance-id ${ocid_instance} --query 'data [0]."public-ip"' \
    --raw-output --query 'data [0]."public-ip"' --raw-output
