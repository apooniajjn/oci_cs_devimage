export availability_domain
export vcn_name
export subnet_name
export image_name="Oracle Cloud Developer Image"
export shape="VM.Standard.E2.1"
export comp_name="TestCompartment"
export ocid_comp=$(oci iam compartment list --query "data [?\"name\"=='${comp_name}'] | [0].id" --raw-output); echo "Compartment OCID: " ${ocid_comp}
