available="false"
  version_list=$(oci compute pic version list --listing-id "${ocid_listing}" \
    --query 'sort_by(data,&"time-published")[*].join('"'"' '"'"',["listing-resource-version", "listing-resource-id"]) | join(`\n`, reverse(@))' \
    --raw-output)
  while read image_version ocid_image ;do
    available=$(oci compute pic version get --listing-id "${ocid_listing}" \
      --resource-version "${image_version}" \
      --query 'data."compatible-shapes"|contains(@, `'${shape}'`)' \
      --raw-output)
    if [[ "${available}" = "true" ]]; then
      break
    fi
    echo_message "Version ${image_version} not available for your shape; skipping"
  done <<< "${version_list}"
