#!/bin/bash

if [ -z "$display_name"] || [ -z "$availability_domain"] || [ -z "$ocid_comp"] || [ -z "$shape"] || [ -z "$public_key"]
then
  echo "Error: missing variable definitions"
  exit 1
fi

ocid_instance=$(oci compute instance launch \
    --display-name "${display_name}" \
    --availability-domain "${availability_domain}" \
    --compartment-id "${ocid_comp}" \
    --subnet-id "${ocid_subnet}" \
    --image-id "${ocid_image}" \
    --shape "${shape}" \
    --ssh-authorized-keys-file "${public_key}" \
    --assign-public-ip true \
    --wait-for-state RUNNING \
    --query 'data.id' \
    --raw-output)