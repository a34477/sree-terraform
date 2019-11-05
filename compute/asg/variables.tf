#-------------Launch configuration------------------#
#variable "launchconfig_name" {
#    description = "Launch configuration name"
#}

#variable "launchconfig_spot_name" {
#    description = "Launch configuration name"
#}

variable "stack_name" {
    description = "Launch configuration & ASG names"
}

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


variable "monitoring" {
  description = "monitoring"
}

#variable "purchasingoption" {
#  description = "purchasingoption"
#}


variable "purchasingoption-spot" {
  description = "purchasingoption-spot"
}

variable "purchasingoption-ondemand" {
  description = "purchasingoption-ondemand"
}

variable "aws_sns_topic_arn" {
  description = "SNS topic name to send notification"
}
