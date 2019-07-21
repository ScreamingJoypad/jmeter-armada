
aws ec2 start-instances --instance-ids i-038adcd1683916c65 #(recommend using a static instance for the master)

# Bring up the fleet based on the config.json file | print the response into a system variable "sfr" 
sfr=$(aws ec2 request-spot-fleet --spot-fleet-request-config file://config.json | tr -d '"' | awk '/SpotFleet/{print $2} ')

# listing the ip addresses for the spot instance 
awsip=$(aws ec2 describe-instances --filter Name=tag:aws:ec2spot:fleet-request-id,Values=$sfr | grep PublicIpAddress | awk -v ORS= '{ print $2 }' | tr -d '"' | sed 's/.$//')

# get the current ip address of the master node

#ssh onto the master Node
ssh -t -i ~/keys/jmeter-key.pem ubuntu@$masip "docker exec -it master /jmeter/apache-jmeter-3.3/bin/jmeter.sh -Jjmeter.save.saveservice.autoflush=true -n -t /jmeter/apache-jmeter-3.3/bin/mount/jmeterscript.jmx -l /jmeter/apache-jmeter-3.3/bin/mount/$(date +s%).jtl -R$awsip"

