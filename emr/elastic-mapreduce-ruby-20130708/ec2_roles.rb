#
# Copyright 2008-2010 Amazon.com, Inc. or its affiliates.  All Rights Reserved.

module EC2Roles
  # These are constants for IAM Roles.
  #
  # Not to be confused with instance group roles (master, core, task).

  DEFAULT_EMR_ROLE = "EMRJobflowDefault"

  ROLE_DEF = '{
"Version":"2008-10-17",
"Statement":[{
               "Sid":"",
               "Effect":"Allow",
               "Principal":{"Service":"ec2.amazonaws.com"},
               "Action":"sts:AssumeRole"}
            ]
  }'

  POLICY_DOC = '{
  "Statement": [
    {
     "Action": [
       "cloudwatch:*",
       "dynamodb:*",
       "ec2:Describe*",
       "elasticmapreduce:Describe*",
       "rds:Describe*",
       "s3:*",
       "sdb:*",
       "sns:*",
       "sqs:*"
     ],
     "Effect": "Allow",
     "Resource": [
       "*"
        ]
    }
  ]
}'

end
