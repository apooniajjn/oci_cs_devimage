#!/bin/bash

export availability_domain="AD-2"
export vcn_name="TestVCN"
export subnet_name="Public Subnet-TestVCN"
export image_name="Oracle Cloud Developer Image"
export shape="VM.Standard.E2.1.Micro"
export comp_name="TestCompartment"
export instance_name=${image_name}
export public_key="/home/andy_tael/.ssh/atael_id_rsa.pub"
export ocid_comp=$(oci iam compartment list --query "data [?\"name\"=='${comp_name}'] | [0].id" --raw-output); echo "Compartment OCID: " ${ocid_comp}
export availability_domain=$(oci iam availability-domain list --all --query 'data[?contains(name, `'"${availability_domain}"'`)] | [0].name' --raw-output); echo "AD Name: " ${availability_domain}
export ocid_vcn=$(oci network vcn list --compartment-id ${ocid_comp} --query "data [?\"display-name\"=='${vcn_name}'] | [0].id" --raw-output); echo "OCID VCN: " ${ocid_vcn}
export ocid_subnet=$(oci network subnet list  --compartment-id ${ocid_comp} --vcn-id ${ocid_vcn} --query "data [?\"display-name\"=='${subnet_name}'] | [0].id" --raw-output); echo "OCID Subnet :" ${ocid_subnet}
