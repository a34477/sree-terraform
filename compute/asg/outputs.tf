#------------ondemand--------------------#

output "sree-launch-configuration_name" {
    value = "${aws_launch_configuration.sree-launch-configuration.name}"
}

output "sree-launch-configuration-spot_name" {
    value = "${aws_launch_configuration.sree-launch-configuration-spot.name}"
}

output "sree-asg_name" {
  value = "${aws_autoscaling_group.sree-asg.name}"
}

output "sree-asg-spot_name" {
  value = "${aws_autoscaling_group.sree-asg-spot.name}"
}

output "sree-asg-site24x7" {
  value = "${aws_autoscaling_group.sree-asg-site24x7.name}"
}
