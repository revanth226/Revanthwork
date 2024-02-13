#!/bin/bash

#############################
# Author: Revanth
# Date: 12th-Feb
#
# Version: v1
#
# This script will report the AWS resource usage
# Pre-Request - Need to Configure AWS CLI before running the script
#############################

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users
# AWS VPC

# Variables
buckets="$(aws s3 ls)"
instances_state="$(aws ec2 describe-instances --query 'Reservations[].Instances[*].{InstanceId: InstanceId, State: State.Name, PublicIpAddress:PublicIpAddress, InstanceType: InstanceType}' --output table)"
Lambda="$(aws lambda list-functions --query 'Functions[*].{FunctionName:FunctionName}' --output table )"
iamusers="$(aws iam list-users --query 'Users[*].{Users: UserName}' --output table)"
vpcid="$(aws ec2 describe-vpcs --query 'Vpcs[*].{"VPC ID":VpcId, "CIDR Block":CidrBlock}' --output table)"


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