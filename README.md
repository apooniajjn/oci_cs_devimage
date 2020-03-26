# oci_cs_devimage
Using OCI Cloud Shell and OCI CLI a to create an Oracle Cloud Developer Image

Clone GIT repo that contains all the necessary scripts
andy_tael@cloudshell:~ (us-ashburn-1)$ git clone https://github.com/andytael/oci_cs_devimage.git
Cloning into 'BTOD VertDesk'...
remote: Enumerating objects: 128, done.
remote: Counting objects: 100% (128/128), done.
remote: Compressing objects: 100% (89/89), done.
remote: Total 128 (delta 77), reused 87 (delta 38), pack-reused 0
Receiving objects: 100% (128/128), 14.57 KiB | 0 bytes/s, done.
Resolving deltas: 100% (77/77), done.

cd into the oci_cs_devimage directory
andy_tael@cloudshell:~ (us-ashburn-1)$ cd oci_cs_devimage/
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ 

Modify the env_vars.sh file to your environment:
# Modify the following variables to reflect your enviroment
export profile="DEFAULT"                            # Profile name in the OCI CLI config file
export vcn_name="TestVCN"                           # Name of the VCN where the instance will live
export subnet_name="Public Subnet-TestVCN"          # Name of the Public Subnet
export image_name="Oracle Cloud Developer Image"    # Name of the Marketplace Image
export shape="VM.Standard.E2.1.Micro"               # Shape to use with the Image (This is the Free version)
export comp_name="TestCompartment"                  # Which compartment
export instance_name=${image_name}                  # Name of the instane
export bucket_name="MyBucket"                       # Name of the Object Storaget bucket  
export public_key="/home/andy_tael/.ssh/id_rsa.pub" # Path to the SSH Public Key
export private_key="/home/andy_tael/.ssh/id_rsa"    # Path to the SSH Private Key

Set the environment variables:
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ source env_vars.sh 
Make sure all vars are set!!!
Compartment OCID:  ocid1.compartment.oc1..aaaaaaaaf63o73do4v7l5rxuwhvrwswzbnrrwhcvs4r3d45nshah2vossfya
OCID VCN:          ocid1.vcn.oc1.iad.amaaaaaaeooclyyazgo6a7b2vd4otwg34vswp3x7xmlsf3tcxy3kzgjm2mga
OCID Subnet:       ocid1.subnet.oc1.iad.aaaaaaaaa52hmfab6r4idfdeuqxb5rlgme74lnuelo4jt5c2d24wnezetg2a
AD Name:           sCJw:US-ASHBURN-AD-1
Shape Name:        VM.Standard.E2.1.Micro
Namespace:         iduxztbq5srk
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ 
