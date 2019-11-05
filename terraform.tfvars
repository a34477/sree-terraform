aws_region="us-east-1"
aws_profile="sree"


#-------------------------ELB-----------------------------#
stack_name="sree"
subnets = ["subnet-xxxxx","subnet-xxxx",subnet-xxxxx"]
internal = "false"
security_groups = ["sg-xxxxxxx","sg-xxxxx","sg-xxxxx"]
cross_zone_load_balancing = "true"
idle_timeout = "60"
connection_draining = "true"
connection_draining_timeout = "300"
bucket = "sreeserver-logs"
bucket_prefix ="sree-ELB"
instance_port1 = "8080"
instance_protocol1 = "HTTP"
lb_port1 = "443"
lb_protocol1 = "HTTPS"
instance_port2 = "9090"
instance_protocol2 = "HTTP"
lb_port2 = "9090"
lb_protocol2 = "HTTPS"
ssl_certificate_id="arn:aws:acm:us-east-1:xxxxxxxx:certificate/xxxxxxxxxxxxxxx"
elb_healthy_threshold = "2"
elb_unhealthy_threshold = "7"
elb_timeout = "5"
elb_target = "HTTP:9090/manage/health"
elb_interval = "30"
tag_name = "Sree-ELB"
projectname = "sree"
environment = "prod"
costgroup = "Basic"
server = "API"

#----------------------------Launch configuration----------------------#
image_id="ami-xxxxxx"
instance_type="m4.large"
iam_instance_profile="SREE"
key_name="sree-api"
launchconfig_sg=["sg-xxxxxx","sg-xxxxxx","sg-xxxxxx"]
associate_public_ip_address="true"
enable_monitoring="false"
spot_price = "0.05"
volume_size="60"



#----------------------------Autoscaling---------------------------------#
vpc_zone_identifier=["subnet-xxxxx","subnet-xxxxx","subnet-xxxxx"]
max_size="0"
min_size="0"
desired_capacity="0"
health_check_grace_period="300"
health_check_type="ELB"
default_cooldown="300"
termination_policies = ["OldestInstance","OldestLaunchConfiguration"]
tag_name = "/SREE/production"
environment = "Prod"
aws_sns_topic_arn="arn:aws:sns:us-east-1:xxxxxxxxx:SREE-TEAM"
aws_sns_topic_arn2="arn:aws:sns:us-east-1:xxxxxxxxxx:SREE-L2"
purchasingoption-spot="SPOT"
purchasingoption-ondemand="ONDEMAND"
monitoring="site24"
