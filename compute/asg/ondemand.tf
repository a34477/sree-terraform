###------------------------Ondemand-------------------------##
resource "aws_launch_configuration" "sree-launch-configuration" {
  name                 ="${var.stack_name}-ONDEMAND-LC"
  image_id             = "${var.image_id}"
  instance_type        = "${var.instance_type}"
  iam_instance_profile = "${var.iam_instance_profile}"
  key_name             = "${var.key_name}"
  security_groups  = "${var.launchconfig_sg}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  enable_monitoring           = "${var.enable_monitoring}"
  user_data                   = "${file("user-data.sh")}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "${var.volume_size}"
    delete_on_termination = true
  }

}


##------------------ondemand ASG-----------------##
resource "aws_autoscaling_group" "sree-asg" {

  name ="${var.stack_name}-ONDEMAND-ASG"
  launch_configuration      = "${aws_launch_configuration.sree-launch-configuration.name}"
  vpc_zone_identifier       = ["${var.vpc_zone_identifier}"]
  max_size                  = "${var.max_size}"
  min_size                  = "${var.min_size}"
  desired_capacity          = "${var.desired_capacity}"
  load_balancers            = ["${var.load_balancers}"]
  health_check_grace_period = "${var.health_check_grace_period}"
  health_check_type         = "${var.health_check_type}"
  default_cooldown          = "${var.default_cooldown}"
  termination_policies      = "${var.termination_policies}"

  tags = [{
    key                 = "Name"
    value               = "${var.tag_name}"
    propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "${var.projectname}"
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = "${var.environment}"
      propagate_at_launch = true
    },
    {
      key                 = "Cost_Group"
      value               = "${var.costgroup}"
      propagate_at_launch = true
    },
    {
      key                 = "Server"
      value               = "${var.server}"
      propagate_at_launch = true
    },
    {
      key                 = "Purchasing option"
      value               = "${var.purchasingoption-ondemand}"
      propagate_at_launch = true
    }
  ]

}

resource "aws_autoscaling_notification" "asg_notifications" {
  group_names = [
    "${aws_autoscaling_group.sree-asg.name}",
  ]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = "${var.aws_sns_topic_arn}"
}
