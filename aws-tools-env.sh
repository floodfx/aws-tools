#!/bin/bash

script_path=${BASH_SOURCE:-$0}

# If this script isn't referenced by its full path, prepend the working directory
if [ "`echo $script_path|cut -b1`" == "/" ]; then
    dir=$(dirname "$script_path")
else
    dir=$(pwd)/$(dirname "$script_path")
fi

# define homes of all CLI tools
export AWS_TOOLS_HOME=$dir
export EC2_AMITOOL_HOME=$dir/ami-tools/ec2-ami-tools-1.4.0.7
export AWS_AUTO_SCALING_HOME=$dir/autoscaling/AutoScaling-1.0.49.1
export AWS_CLOUDFORMATION_HOME=$dir/cloudformation/AWSCloudFormation-1.0.9
export CS_HOME=$dir/cloudsearch/cloud-search-tools-1.0.0.1-2012.03.05
export AWS_CLOUDWATCH_HOME=$dir/cw/CloudWatch-1.0.12.1
export EC2_HOME=$dir/ec2/ec2-api-tools-1.5.2.4
export AWS_ELASTICACHE_HOME=$dir/elasticcache/AmazonElastiCacheCli-1.6.000
export AWS_ELB_HOME=$dir/elb/ElasticLoadBalancing-1.0.15.1
export AWS_EMR_HOME=$dir/emr/elastic-mapreduce-ruby-20120418
export AWS_IAM_HOME=$dir/iam/IAMCli-1.4.0
export AWS_RDS_HOME=$dir/rds/RDSCli-1.6.001
export AWS_SNS_HOME=$dir/sns/SimpleNotificationServiceCli-1.0.3.0

# add executables to the PATH
export PATH=$PATH:$EC2_AMITOOL_HOME/bin
export PATH=$PATH:$AWS_AUTO_SCALING_HOME/bin
export PATH=$PATH:$AWS_CLOUDFORMATION_HOME/bin
export PATH=$PATH:$CS_HOME/bin
export PATH=$PATH:$AWS_CLOUDWATCH_HOME/bin
export PATH=$PATH:$EC2_HOME/bin
export PATH=$PATH:$AWS_ELASTICACHE_HOME/bin
export PATH=$PATH:$AWS_ELB_HOME/bin
export PATH=$PATH:$AWS_EMR_HOME
export PATH=$PATH:$AWS_IAM_HOME/bin
export PATH=$PATH:$AWS_RDS_HOME/bin
export PATH=$PATH:$AWS_SNS_HOME/bin

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
  echo "WARNING: AWS_ACCESS_KEY_ID must be set before running $script_path" >&2
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  echo "WARNING: AWS_SECRET_ACCESS_KEY must be set before running $script_path" >&2
fi

if [ -z "$EC2_PRIVATE_KEY" ]; then
  echo "WARNING: EC2_PRIVATE_KEY must be set before running ec2-* commands" >&2
fi

if [ -z "$EC2_CERT" ]; then
  echo "WARNING: EC2_CERT must be set before running ec2-* commands" >&2
fi


# check credentials setup
if [ -f $AWS_CREDENTIAL_FILE ]; then
  # make sure credentials are current
  TF=`mktemp cred.XXX`
  echo "AWSAccessKeyId=${AWS_ACCESS_KEY_ID}" > $TF
  echo "AWSSecretKey=${AWS_SECRET_ACCESS_KEY}" >> $TF

  cmp --quiet $AWS_CREDENTIAL_FILE $TF
  
  # warn and replace if different
  if [ $? -ne 0 ]; then
    echo "WARNING: AWS_CREDENTIAL_FILE did not contain the currently set AWS_ACCESS_KEY_ID and/or AWS_SECRET_ACCESS_KEY. Updating $AWS_CREDENTIAL_FILE with currently set keys." >&2
    cp $TF $AWS_CREDENTIAL_FILE
  fi
  rm -f $TF
else
  # create credentials file using AWS account  
  AWS_CREDENTIAL_FILE=~/.aws_credentials
  echo "AWSAccessKeyId=${AWS_ACCESS_KEY_ID}" > $AWS_CREDENTIAL_FILE
  echo "AWSSecretKey=${AWS_SECRET_ACCESS_KEY}" >> $AWS_CREDENTIAL_FILE
  echo "WARNING: AWS_CREDENTIAL_FILE was not set.  Created one at $AWS_CREDENTIAL_FILE" >&2
fi

export AWS_CREDENTIAL_FILE=$AWS_CREDENTIAL_FILE
