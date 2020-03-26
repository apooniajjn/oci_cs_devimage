#!/bin/bash

if [ -z "$ocid_listing" ] || [ -z "$ocid_comp" ] || [ -z "$image_version" ] || [ -z "$signature" ] || [ -z "$oracle_tou_link" ] || [ -z "$time_retrieved" ]
then
  echo "Error: missing variable definitions"
  exit 1
fi

subscription=$(oci compute pic subscription create --listing-id "${ocid_listing}" \
    --compartment-id "${ocid_comp}" \
    --resource-version  "${image_version}" \
    --signature "${signature}" \
    --oracle-tou-link "${oracle_tou_link}" \
    --time-retrieved "${time_retrieved}" \
    --query 'data."listing-id"' \
    --raw-output); echo "OCID Listing: " ${ocid_listing}; echo "Subscription: " ${subscription}