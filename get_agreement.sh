agreement=$(oci compute pic agreements get --listing-id "${ocid_listing}" \
    --resource-version  "${image_version}" \
    --query '[data."oracle-terms-of-use-link", data.signature, data."time-retrieved"] | join(`\n`,@)' \
    --raw-output); { read oracle_tou_link; read signature; read time_retrieved ; } <<< "${agreement}"; time_retrieved="${time_retrieved:0:23}Z"