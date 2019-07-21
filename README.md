# jmeter-armada

# The Setup
This process requires a certain number of assets to be in place already withing AWS. You'll beed a particular Role within AWS that has the access you need to perform the actions that that the Armada Requires. Those actions include:

IAM
ListRoles
PassRole
ListInstanceProfiles
AddRoleToInstanceProfile
AttachRolePolicy
CreateInstanceProfile
CreateRole
GetRole
ListPolicies

EC2
ec2:DescribeImages",
                "ec2:DescribeSubnets",
                "ec2:RequestSpotInstances",
                "ec2:TerminateInstances",
                "ec2:DescribeInstanceStatus
                                "ec2:DescribeImages",
                "ec2:DescribeSubnets",
                "ec2:RequestSpotInstances",
                "ec2:TerminateInstances",
                "ec2:DescribeInstanceStatus",
                "ec2:CreateTags"

ELB
                elasticloadbalancing:RegisterInstancesWithLoadBalancer
                elasticloadbalancing:RegisterTargets

Now if you've ever had to set up IAM artifacts in the past you'll know that it can be a real pain. However by setting up the AWS command line....

<setting up the aws cli>

# Create the IAMFleetRole

Create the instance profile
aws iam create-instance-profile --instance-profile-name MikesSpotFleet2

Create the role
aws iam create-role --role-name AmazonEC2SpotFleetRole2 \
    --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Sid":"","Effect":"Allow","Principal":{"Service":"spotfleet.amazonaws.com"},"Action":"sts:AssumeRole"}]}'

Create the policy
aws iam create-policy --policy-name my-policy --policy-document file://policy

Attach the policies to the role
aws iam attach-role-policy --policy-arn arn:aws:iam::133060985476:policy/myspotfleetpolicy --role-name AmazonEC2SpotFleetRole2
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetRole --role-name AmazonEC2SpotFleetRole2
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetTaggingRole --role-name AmazonEC2SpotFleetRole2



sfr=$(aws ec2 request-spot-fleet --spot-fleet-request-config file://config.json | tr -d '"' | awk '/SpotFleet/{print $2} ')





creat the policy
aws iam create-policy --policy-name my-policy --policy-document file://policy


Create this from IAM - grab the arn from its profile
aws iam create-policy --policy-name my-policy --policy-document file://policy

aws iam create-instance-profile --instance-profile-name MikesSpotFleet

aws iam create-role --role-name AmazonEC2SpotFleetRole \
    --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Sid":"","Effect":"Allow","Principal":{"Service":"spotfleet.amazonaws.com"},"Action":"sts:AssumeRole"}]}'

    aws iam attach-role-policy \
    --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetTaggingRole \
    --role-name AmazonEC2SpotFleetRole

    aws iam attach-role-policy \
    --policy-arn arn:aws:iam::133060985476:policy/myspotfleetpolicy \
    --role-name AmazonEC2SpotFleetRole



AmazonEC2FullAccess

then attach the policy to the role
aws iam attach-role-policy --policy-arn arn:aws:iam::133060985476:policy/myspotfleetpolicy --role-name AmazonEC2SpotFleetRole
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetRole --role-name AmazonEC2SpotFleetRole
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetTaggingRole --role-name AmazonEC2SpotFleetRole






# Create the config.json file
This is going to depend on how powerful the users want their instances

# create the userdata if needed 
Minimum would be mine, anything else would be included here

# subnets
Create the subnets needed

# create a key
Create a keypair for the instances

# create a security group
Create the security group for the instances 
