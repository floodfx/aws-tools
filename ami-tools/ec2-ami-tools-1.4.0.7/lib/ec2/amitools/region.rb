# Copyright 2008-2009 Amazon.com, Inc. or its affiliates.  All Rights
# Reserved.  Licensed under the Amazon Software License (the
# "License").  You may not use this file except in compliance with the
# License. A copy of the License is located at
# http://aws.amazon.com/asl or in the "license" file accompanying this
# file.  This file is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See
# the License for the specific language governing permissions and
# limitations under the License.

# Module to hold region informations
#

module AwsRegion

  AWS_REGIONS = [
    'eu-west-1',
    'us-east-1',
    'us-gov-west-1',
    'us-west-1',
    'us-west-2',
    'ap-southeast-1',
    'ap-northeast-1',
    'sa-east-1',
  ]

  S3_LOCATIONS = [
    'EU',
    'US',
    'us-gov-west-1',
    'us-west-1',
    'us-west-2',
    'ap-southeast-1',
    'ap-northeast-1',
    'sa-east-1',
  ]

  GOV_REGIONS = [
    'us-gov-west-1',
  ]

  module_function

  def guess_region_from_s3_bucket(location)
    if (location == "EU")
      return "eu-west-1"
    elsif ((location == "US") || (location == "") || (location.nil?))
      return "us-east-1"
    else 
      return location
    end
  end

  def get_s3_location(region)
    if (region == "eu-west-1")
      return 'EU'
    elsif (region == "us-east-1")
      return :unconstrained
    else
      return region
    end
  end

  def is_gov(region)
    return GOV_REGIONS.include?(region)
  end

  def regions
    AWS_REGIONS
  end

  def s3_locations
    S3_LOCATIONS
  end

end

