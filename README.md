# oci_cs_devimage
Using OCI Cloud Shell and OCI CLI a to create an Oracle Cloud Developer Image

Create ssh keys

set env vars

andy_tael@cloudshell:~ (us-ashburn-1)$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/andy_tael/.ssh/id_rsa): 
Created directory '/home/andy_tael/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/andy_tael/.ssh/id_rsa.
Your public key has been saved in /home/andy_tael/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:RptPSje42IPvzgQpTQT0uC05dgpn/F5suET964mbhYA andy_tael@926a2bc854c9
The key's randomart image is:
+---[RSA 2048]----+
|   .o..          |
|     +           |
|    . o .        |
|   . B + +       |
|  . E O S +      |
|   = O @ O .     |
|    . * @ +      |
|     o B = o     |
|      ooOo+      |
+----[SHA256]-----+
andy_tael@cloudshell:~ (us-ashburn-1)$ 

git clone https://github.com/andytael/oci_cs_devimage.git
cd oci-cs_devimage

source env-vars.sh

.. all the steps


get the private and public key (clumsy but necessary)

