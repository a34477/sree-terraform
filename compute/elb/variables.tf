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
  description = "The name of the ELB"
}

variable "projectname" {
  description = "The name of the project"
}

variable "environment" {
  description = "The name of the env"
}

variable "costgroup" {
  description = "The name of the cost  group"
}

variable "server" {
  description = "The name of the server"
}

variable "stack_name" {
  description = "Name of stack"
}
