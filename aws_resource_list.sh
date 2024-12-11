#!/bin/bash

####################################################################
# This script will list all the AWS resources in the AWS account
# Author: Leonardo Monte
# Version: v1
#
# Following are the supported AWS services by the script
# 1. EC2
# 2. S3
# 3. RDS
# 4. DynamoDB
# 5. Lambda
# 6. EBS
# 7. ELB
# 8. CloudFront
# 9. CloudWatch
# 10. SNS
# 11. SQS
# 12. Route53
# 13. VPC
# 14. CloudFormation
# 15. IAM
#
# Usage: ./aws_resource_list.sh <region> <service_name>
# Example: ./aws_resource_list.sh us-east-1 ec2
####################################################################

# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
    echo "Usage: $0 <region> <service_name>"
    exit 1
fi

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it and try again"
    exit 1
fi

# Check if the AWS CLI is configured
if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please configure it and try again"
    exit 1
fi

# Execute the AWS CLI command based on the service name
case $2 in
    ec2)
        aws ec2 describe-instances --region $1
        ;;
    s3)
        aws s3 ls --region $1
        ;;
    rds)
        aws rds describe-db-instances --region $1
        ;;
    dynamodb)
        aws dynamodb list-tables --region $1
        ;;
    lambda)
        aws lambda list-functions --region $1
        ;;
    ebs)
        aws ec2 describe-volumes --region $1
        ;;
    elb)
        aws elb describe-load-balancers --region $1
        ;;
    cloudfront)
        aws cloudfront list-distributions --region $1
        ;;
    cloudwatch)
        aws cloudwatch list-metrics --region $1
        ;;
    sns)
        aws sns list-topics --region $1
        ;;
    sqs)
        aws sqs list-queues --region $1
        ;;
    route53)
        aws route53 list-hosted-zones --region $1
        ;;
    vpc)
        aws ec2 describe-vpcs --region $1
        ;;
    cloudformation)
        aws cloudformation list-stacks --region $1
        ;;
    iam)
        aws iam list-users --region $1
        ;;
    *)
        echo "Invalid service name. Please provide a valid service name"
        exit 1
        ;;
esac
