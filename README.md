# Oracle Cloud Infrastructure Cloud Shell - Deploy a Instance using Market Place image
Use OCI Cloud Shell and OCI CLI to create an Oracle Cloud Developer Image. 

> Note that all the output variables are obfuscated for security reasons.

## Pre-Requisites: 

- You must have a working OCI env where you are ready to deploy VM instance. 
    - This include VCN, Subnet etc

## Create SSH keys
As we are deploying a VM and we need access to the VM so we need SSH keys and there are three options that can be used as below: 

1. Create keys in Cloud Shell following this documentation: https://docs.cloud.oracle.com/en-us/iaas/Content/GSG/Tasks/creatingkeys.htm
2. Copy your current key to the Cloud Shell. The easiest way to do this is to open a vi session and copy paste between screens.
3. Use Object Storage (Pre-AUth not Public) to move the keys between your environment and Cloud Shell

## Clone GIT repo that contains all the necessary scripts

Clone repo to your cloud shell env:

```bash
andy_tael@cloudshell:~ (us-ashburn-1)$ git clone https://github.com/andytael/oci_cs_devimage.git
Cloning into 'oci_cs_devimage'...
remote: Enumerating objects: 128, done.
remote: Counting objects: 100% (128/128), done.
remote: Compressing objects: 100% (89/89), done.
remote: Total 128 (delta 77), reused 87 (delta 38), pack-reused 0
Receiving objects: 100% (128/128), 14.57 KiB | 0 bytes/s, done.
Resolving deltas: 100% (77/77), done.
```

Change your working directory to cloned repo: 

```bash
andy_tael@cloudshell:~ (us-ashburn-1)$ cd oci_cs_devimage/
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ 
```

## Modify the env_vars.sh file to your environment:

You must update variables present in `env_vars.sh` file to reflect correct changes as per your enviornment: 

```bash
export vcn_name="TestVCN"                           # Name of the VCN where the instance will live
export subnet_name="Public Subnet-TestVCN"          # Name of the Public Subnet
export image_name="Oracle Cloud Developer Image"    # Name of the Marketplace Image
export shape="VM.Standard.E2.1.Micro"               # Shape to use with the Image (This is the Free version)
export comp_name="TestCompartment"                  # Which compartment
export instance_name=${image_name}                  # Name of the instane
export bucket_name="MyBucket"                       # Name of the Object Storaget bucket  
export public_key="/home/andy_tael/.ssh/id_rsa.pub" # Path to the SSH Public Key
export private_key="/home/andy_tael/.ssh/id_rsa"    # Path to the SSH Private Key
```

## Set the environment variables:

Source your enviornment variables using below command: 

```bash
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ source env_vars.sh 
Make sure all vars are set!!!
Compartment OCID:  ocid1.compartment...
OCID VCN:          ocid1.vcn.oc1...
OCID Subnet:       ocid1.subnet...
AD Name:           ....:US-ASHBURN-AD-1
Shape Name:        VM.Standard.E2.1.Micro
Namespace:         iduxztbq....
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ 
```
## Get the Partner Image Catalog (PIC) listing:

Find the OCID listing values associated with your Marketplace image: 

```bash
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ source pic_listing.sh 
PIC Listing:  ocid1.appcataloglisting.oc1... Oracle Cloud Developer Image
OCID Listing:  ocid1.appcataloglisting.oc1...
Display Name:  Oracle Cloud Developer Image
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ 
```
## Get the latest version of the image:

Find the latest value of MP image:

```bash
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ source pic_latest_ver.sh 
Version List: Oracle_Cloud_Developer_Image_19.11 ocid1.image.oc1...
Image Version:  Oracle_Cloud_Developer_Image_19.11
OCID Image:  ocid1.image.oc1...
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ 
```
## Get the agreement:

```bash
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ source get_agreement.sh 
Agreement : https://objectstorage.us-ashburn-1.oraclecloud.com/n/partnerimagecatalog/b/eulas/o/oracle-apps-terms-of-use.txt fa771f612129bb9019965af32235ef5e7603621dbdb0d... 2020-03-26T20:33:20.089000+00:00
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ 
```
## Get the subscription:
```bash
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ source get_subscription.sh 
OCID Listing:  ocid1.appcataloglisting.oc1...
Subscription:  ocid1.appcataloglisting.oc1...
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ 
```
## Provison the image:

Create the instance using collected information so far:

```bash
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ source provison_mp_image.sh
```
## SSH into the VM

At this point instance should be deployed on your OCI console, please verify and grab the public IP associated with your instance to login: 

```bash
andy_tael@cloudshell:oci_cs_devimage (us-ashburn-1)$ ssh -i ~/.ssh/id_rsa opc@xx.xx.xx.xx
```

## Start a SSH Tunnel and connect to the VM on your local machine

If needed you can create an SSH tunnel from your local machine too.

```bash
ssh...
```
