provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

##----------------ELB-------------------##
module "elb" {
  source                      = "./compute/elb"
  stack_name                  = "${var.stack_name}"
  subnets                     = ["${var.subnets}"]
  internal                    = "${var.internal}"
  security_groups             = ["${var.security_groups}"]
  cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  idle_timeout                = "${var.idle_timeout}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"
  bucket                      = "${var.bucket}"
  bucket_prefix               = "${var.bucket_prefix}"
  instance_port1              = "${var.instance_port1}"
  instance_protocol1          = "${var.instance_protocol1}"
  lb_port1                    = "${var.lb_port1}"
  lb_protocol1                = "${var.lb_protocol1}"
  instance_port2              = "${var.instance_port2}"
  instance_protocol2          = "${var.instance_protocol2}"
  lb_port2                    = "${var.lb_port2}"
  lb_protocol2                = "${var.lb_protocol2}"
  elb_healthy_threshold       = "${var.elb_healthy_threshold}"
  elb_unhealthy_threshold     = "${var.elb_unhealthy_threshold}"
  elb_timeout                 = "${var.elb_timeout}"
  elb_target                  = "${var.elb_target}"
  elb_interval                = "${var.elb_interval}"
  ssl_certificate_id          = "${var.ssl_certificate_id}"
  tag_name                    = "${var.tag_name}"
  projectname                 = "${var.projectname}"
  environment                 = "${var.environment}"
  costgroup                   = "${var.costgroup}"
  server                      = "${var.server}"
}

#-------------------LC--------------------#
module "asg" {
  source               = "./compute/asg"
  stack_name           = "${var.stack_name}"
  image_id             = "${var.image_id}"
  instance_type        = "${var.instance_type}"
  iam_instance_profile = "${var.iam_instance_profile}"
  key_name             = "${var.key_name}"
  spot_price           = "${var.spot_price}"
  launchconfig_sg         = ["${var.launchconfig_sg}"]
  associate_public_ip_address = "${var.associate_public_ip_address}"
  enable_monitoring           = "${var.enable_monitoring}"
  volume_size                 = "${var.volume_size}"
  vpc_zone_identifier         = ["${var.vpc_zone_identifier}"]
  max_size                    = "${var.max_size}"
  min_size                    = "${var.min_size}"
  desired_capacity            = "${var.desired_capacity}"
  load_balancers              = ["${module.elb.hubble_elb_name}"]
  health_check_grace_period   = "${var.health_check_grace_period}"
  health_check_type           = "${var.health_check_type}"
  default_cooldown            = "${var.default_cooldown}"
  termination_policies        = "${var.termination_policies}"
  tag_name                    = "${var.tag_name}"
  environment                 = "${var.environment}"
  projectname                 = "${var.projectname}"
  costgroup                   = "${var.costgroup}"
  server                      = "${var.server}"
  monitoring                  = "${var.monitoring}"
  #purchasingoption            = "${var.purchasingoption}"
  purchasingoption-spot       = "${var.purchasingoption-spot}"
  purchasingoption-ondemand       = "${var.purchasingoption-ondemand}"
  aws_sns_topic_arn           = "${var.aws_sns_topic_arn}"
}
