#!/bin/bash

oci compute instance list-vnics --instance-id ocid1.instance.oc1.iad.anuwcljseooclyyclyan44kedinu5uwqhldvxh45idqjrfv4uo745bv6ydlq --query 'data [0]."public-ip"' --raw-output
