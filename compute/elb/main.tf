####----------------Creating ELB ---------------------------###
resource "aws_elb" "hubble_elb" {
  #name                        = "${var.elb_name}"
  name    = "${var.stack_name}-ELB-v1"
  subnets                     = ["${var.subnets}"]
  internal                    = "${var.internal}"
  security_groups             = ["${var.security_groups}"]
  cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  idle_timeout                = "${var.idle_timeout}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

  access_logs {
    bucket        = "${var.bucket}"
    bucket_prefix = "${var.bucket_prefix}"
    interval      = 5
  }

  listener = [
    {
      instance_port      = "${var.instance_port1}"
      instance_protocol  = "${var.instance_protocol1}"
      lb_port            = "${var.lb_port1}"
      lb_protocol        = "${var.lb_protocol1}"
      ssl_certificate_id = "${var.ssl_certificate_id}"
    },
    {
      instance_port      = "${var.instance_port2}"
      instance_protocol  = "${var.instance_protocol2}"
      lb_port            = "${var.lb_port2}"
      lb_protocol        = "${var.lb_protocol2}"
      ssl_certificate_id = "${var.ssl_certificate_id}"
    },
  ]

  health_check {
    healthy_threshold   = "${var.elb_healthy_threshold}"
    unhealthy_threshold = "${var.elb_unhealthy_threshold}"
    timeout             = "${var.elb_timeout}"
    target              = "${var.elb_target}"
    interval            = "${var.elb_interval}"
  }

  tags {
    Name        = "${var.tag_name}"
    Project     = "${var.projectname}"
    Environment = "${var.environment}"
    Cost_Group  = "${var.costgroup}"
    Server      = "${var.server}"
  }
}
