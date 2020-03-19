subscription=$(oci compute pic subscription create --listing-id "${ocid_listing}" \
    --compartment-id "${ocid_comp}" \
    --resource-version  "${image_version}" \
    --signature "${signature}" \
    --oracle-tou-link "${oracle_tou_link}" \
    --time-retrieved "${time_retrieved}" \
    --query 'data."listing-id"' \
    --raw-output); echo ${ocid_listing}; echo ${subscription}