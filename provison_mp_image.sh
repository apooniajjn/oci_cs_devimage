$(oci compute instance launch \
    --display-name ${instance_name} \
    --availability-domain "${availability_domain}" \
    --subnet-id "${ocid_subnet}" \
    --image-id "${ocid_image}" \
    --shape "${shape}" \
    --ssh-authorized-keys-file "${public_key}" \
    --assign-public-ip true \
    --wait-for-state RUNNING \
    --query 'data.id' \
    --raw-output)