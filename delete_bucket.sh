#!/bin/bash

if [ -z "$bucket_name" ] || [ -z "$ocid_comp}" ]
then
  echo "Error: missing variable definitions"
  exit 1
fi

oci os preauth-request delete --bucket-name ${bucket_name} --par-id T1iWsXAt+UV55cza5NMhrM2UCxxBPZEcfLZJqAATbjo=:id_rsa --force
oci os preauth-request delete --bucket-name ${bucket_name} --par-id cMo7tWH53fPpNL86SAZmmDcCB9cu/pNYgoqeeXo66Ks=:id_rsa.pub --force
oci os object delete --bucket-name ${bucket_name} --object-name id_rsa --force
oci os object delete --bucket-name ${bucket_name} --object-name id_rsa.pub --force
oci os bucket delete --bucket-name ${bucket_name} --force