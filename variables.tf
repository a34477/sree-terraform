variable aws_region {}
variable aws_profile {}

#-----------------------ELB---------------------##

variable "stack_name" {
    description = "Launch configuration & ASG names"
}

variable "subnets" {
  description = "A list of subnet IDs to attach to the ELB"
  type        = "list"
}

variable "internal" {
  description = "If true, ELB will be an internal ELB"
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the ELB"
  type        = "list"
}

variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  default     = true
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle"
  default     = 60
}

variable "connection_draining" {
  description = "Boolean to enable connection draining"
  default     = false
}

variable "connection_draining_timeout" {
  description = "The time in seconds to allow for connections to drain"
  default     = 300
}

variable "bucket" {
  description = "Bucketname for accesslogs"
}

variable "bucket_prefix" {
  description = "location for accesslogs"
}

variable "instance_port1" {
  description = "Instance port"
  default     = 80
}

variable "instance_port2" {
  description = "LB port"
  default     = 8080
}

variable "instance_protocol1" {
  description = "Instance protocol"
  default     = "HTTP"
}

variable "instance_protocol2" {
  description = "LB protocol"
  default     = "HTTP"
}

variable "lb_port1" {
  description = "Instance protocol"
  default     = 443
}

variable "lb_port2" {
  description = "Instance protocol"
  default     = 443
}

variable "lb_protocol1" {
  description = "Instance protocol"
}

variable "lb_protocol2" {
  description = "Instance protocol"
  default     = "HTTP"
}

variable "ssl_certificate_id" {
  description = "SSL certificate ID"
}

variable "elb_healthy_threshold" {
  description = "ELB healthy threshold"
  default     = 2
}

variable "elb_unhealthy_threshold" {
  description = "ELB unhealthy threshold"
  default     = 7
}

variable "elb_timeout" {
  description = "ELB timeout"
  default     = 5
}

variable "elb_target" {
  description = "ELB target"
  default     = "HTTP:9090/manage/health"
}

variable "elb_interval" {
  description = "ELB interval"
  default     = 30
}


variable "tag_name" {
  description = "ASG tag name"
}

variable "projectname" {
  description = "projectname"
}

variable "environment" {
  description = "ASG tag for environment"
}

variable "costgroup" {
  description = "costgroup"
}

variable "server" {
  description = "server"
}

#variable "purchasingoption" {
#  description = "purchasingoption"
#}

variable "purchasingoption-ondemand" {
  description = "purchasingoption-ondemand"
}


#-------------Launch configuration------------------#
variable "image_id" {
  description = "The EC2 image ID to launch"
  default     = ""
}

#variable "site24x7_image_id" {
#  description = "The EC2 image ID site24x7_image_id"
#  default     = ""
#}

variable "instance_type" {
  description = "The size of instance to launch"
  default     = ""
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with launched instances"
  default     = ""
}

variable "key_name" {
  description = "The key name that should be used for the instance"
  default     = ""
}

variable "launchconfig_sg" {
  description = "A list of security group IDs to assign to the launch configuration"
  type        = "list"
  default     = []
}

variable "associate_public_ip_address" {
  description = "Associate a public ip address with an instance in a VPC"
  default     = false
}

variable "enable_monitoring" {
  description = "Enables/disables detailed monitoring. This is enabled by default."
  default     = true
}

variable "spot_price" {
  description = "The price to use for reserving spot instances"
  default     = ""
}

variable "monitoring" {
  description = "monitoring"
}

variable "volume_size" {
  description = "Volumesize"
  default     = ""
}



###-----------------------------Autoscaling group ----------------------##
variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in"
  type        = "list"
}

variable "max_size" {
  description = "The maximum size of the auto scale group"
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
}

variable "desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
}

variable "load_balancers" {
  description = "A list of elastic load balancer names to add to the autoscaling group names"
  default     = []
}

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health"
  default     = 300
}

variable "health_check_type" {
  description = "Controls how health checking is done. Values are - EC2 and ELB"
}

variable "default_cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start"
  default     = 300
}

variable "termination_policies" {
  description = "A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default"
  type        = "list"
  default     = ["Default"]
}

variable "purchasingoption-spot" {
  description = "purchasingoption-spot"
}

variable "aws_sns_topic_arn" {
  description = "SNS topic name to send notification"
}


##-----------------------ALARMS--------------------##

#
variable "aws_sns_topic_arn2" {
  description = "SNS topic name2"
}

/*
###--------------------SSM--------------------------##
variable "api_host" {
  description = "api host name"
}

variable "api_key" {
  description = "api key"
}

variable "access_key" {
  description = "access_key key"
}

variable "secret_key" {
  description = "secret_key key"
}


variable "cw_config_file" {
  description = "Cloudwatch config file"
}
*/