#!/bin/bash

# Modify the following variables to reflect your enviroment
export vcn_name="TestVCN"                           # Name of the VCN where the instance will live
export subnet_name="Public Subnet-TestVCN"          # Name of the Public Subnet
export image_name="Oracle Cloud Developer Image"    # Name of the Marketplace Image
export shape="VM.Standard.E2.1.Micro"               # Shape to use with the Image (This is the Free version)
export comp_name="TestCompartment"                  # Which compartment
export instance_name=${image_name}                  # Name of the instane
export bucket_name="MyBucket"                       # Name of the Object Storaget bucket  
export public_key="/home/andy_tael/.ssh/id_rsa.pub" # Path to the SSH Public Key
export private_key="/home/andy_tael/.ssh/id_rsa"    # Path to the SSH Private Key

# Get OCID for Compartment
export ocid_comp=$(oci iam compartment list --query "data [?\"name\"=='${comp_name}'] | [0].id" --raw-output); 

# Get OCID for VCN
export ocid_vcn=$(oci network vcn list --compartment-id ${ocid_comp} --query "data [?\"display-name\"=='${vcn_name}'] | [0].id" --raw-output)

# Get OCID for Subnet
export ocid_subnet=$(oci network subnet list --compartment-id ${ocid_comp} --vcn-id ${ocid_vcn} --query "data [?\"display-name\"=='${subnet_name}'] | [0].id" --raw-output)

# Get Object Storage Namespace
export os_namespace=$(oci os ns get --query data --raw-output)

# AD Array
declare -a ad_name=("AD-1" "AD-2" "AD-3")

# Determine which AD the shape is available, over subscription not covered
for i in "${ad_name[@]}"
do
	export availability_domain=$(oci iam availability-domain list --all --query 'data[?contains(name, `'"${i}"'`)] | [0].name' --raw-output)
	export shape_avail=$(oci compute shape list --compartment-id ${ocid_comp} --availability-domain ${availability_domain} --query 'data[?contains(shape, `'"${shape}"'`)] | [0].shape' --raw-output)

	if [[ "${shape_avail}" = "${shape}" ]]; then
      		break
    fi
done

echo "Make sure all vars are set!!!"
echo "Compartment OCID: " ${ocid_comp}
echo "OCID VCN:         " ${ocid_vcn}
echo "OCID Subnet:      " ${ocid_subnet}
echo "AD Name:          " ${availability_domain}
echo "Shape Name:       " ${shape_avail}
echo "Namespace:        " ${os_namespace}
