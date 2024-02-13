#!/bin/bash

#############################
# Author: Revanth
# Date: 12th-Feb
#
# Version: v1
#
# This script will report the AWS resource usage
#############################

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users
# AWS VPC

# Variables
buckets="$(aws s3 ls)"
#instance_id="$(aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId')"
instances_state="$(aws ec2 describe-instances --query 'Reservations[].Instances[*].{InstanceId: InstanceId, State: State.Name, PublicIpAddress:PublicIpAddress, InstanceType: InstanceType}' --output table)"
Lambda="$(aws lambda list-functions | jq '.Functions[].FunctionName')"
iamusers="$(aws iam list-users | jq '.Users[].UserName')"
vpcid="$(aws ec2 describe-vpcs | jq '.Vpcs[].VpcId')"
#status="$(aws ec2 describe-instances | jq '.Reservations[].Instances[].State' | grep Name | cut -d: -f2 | cut -b 3-9)"

# List s3 buckets 

echo "list S3 Buckets"
echo "###########################################################"



if [[ -z "$buckets" ]];
then
    echo "No Buckets available"
else
    echo "Available buckets are"
    echo "$buckets"
fi

echo "                                                            "
# List Ec2 Instances

echo "###########################################################"
echo "List EC2 instance ID"
#aws ec2 describe-instances | grep -i InstanceId | cut -d: -f2|cut -b 3-21
#aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'


echo "###########################################################"
if [[ -z "$instances_state" ]];
then
    echo "No Instancs available"
else
    echo "Instances Details as Below"
    echo "                                                            "
    echo "$instances_state"
fi


# List Lambda Function
echo "                                                            "

echo "###########################################################"
echo "List Lambda Function"

echo "###########################################################"
if [[ -z "$Lambda" ]];
then
    echo "No Lambda functions are available"
else
    echo "Below are available Lambda Function"
    echo "                                                            "
    echo "$Lambda"
fi
echo "###########################################################"

# List IAM Users
echo "                                                            "

echo "###########################################################"
echo "List IAM users"
#aws iam list-users | jq '.Users[].UserName'
echo "###########################################################"
if [[ -z "$iamusers" ]];
then
    echo "No Users are available"
else
    echo "Below are created IAM Users for your AWS Account"
    echo "                                                            "
    echo "$iamusers"
fi
echo "###########################################################"

# List VPC ID
echo "                                                            "

echo "###########################################################"
echo "List VPC ID"

echo "###########################################################"
if [[ -z "$vpcid" ]];
then
    echo "No VPCs are available"
else
    echo "Below are available VPCs for your working region"
    echo "                                                            "
    echo "$vpcid"
fi
echo "###########################################################"