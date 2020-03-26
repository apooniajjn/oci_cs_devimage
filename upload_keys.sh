#!/bin/bash

if [ -z "$os_namespace" ] || [ -z "$bucket_name" ] || [ -z "$ocid_comp}" ]
then
  echo "Error: missing variable definitions"
  exit 1
fi

oci os bucket create --namespace ${os_namespace} --name ${bucket_name} --compartment-id $ocid_comp
oci os object put -bn ${bucket_name} --file ~/.ssh/id_rsa
oci os object put -bn ${bucket_name} --file ~/.ssh/id_rsa.pub
oci os preauth-request create --access-type ObjectRead -bn ${bucket_name} --name Keys --time-expires `date --date='tomorrow' +%Y-%m-%d` -on id_rsa
oci os preauth-request create --access-type ObjectRead -bn ${bucket_name} --name Keys --time-expires `date --date='tomorrow' +%Y-%m-%d` -on id_rsa.pub