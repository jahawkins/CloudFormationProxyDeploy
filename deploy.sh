#!/bin/bash
export PATH=~/Library/Python/2.7/bin/:$PATH
set -e

profile="personal"

# Author: Josh Hawkins (@BinaryFaultline)
# License: GPL-3.0
# Based on script by: Roberto Rodriguez (@Cyb3rWard0g)

echo " "
echo "================================="
echo "* Deploying Proxy Environment   *"
echo "================================="
echo " "
echo "[Proxy-CLOUDFORMATION-INFO] Creating ProxyNetworkStack .."
echo " "
aws --profile $profile --region us-east-1 cloudformation create-stack --stack-name ProxyNetworkStack --template-body file://./cfn-templates/ec2-network-template.json --parameters file://./cfn-parameters/ec2-network-parameters.json
echo " "
echo "[MORDOR-CLOUDFORMATION-INFO] EC2 Network stack template has been sent over to AWS and it is being processed remotely .."
echo "[MORDOR-CLOUDFORMATION-INFO] All other instances depend on it."
echo "[MORDOR-CLOUDFORMATION-INFO] Waiting for ProxyNetworkStack to be created.."
echo " "
aws --profile $profile --region us-east-1 cloudformation wait stack-create-complete --stack-name ProxyNetworkStack
echo " "
echo "[MORDOR-CLOUDFORMATION-INFO] ProxyNetworkStack was created."
echo "[MORDOR-CLOUDFORMATION-INFO] Creating ProxyWin10WorkstationStack .."
echo " "
aws --profile $profile --region us-east-1 cloudformation create-stack --stack-name ProxyWin10Workstation --template-body file://./cfn-templates/windows-workstations-template.json --parameters file://./cfn-parameters/windows-workstations-parameters.json