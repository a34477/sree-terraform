output "hubble_elb_id" {
  description = "The name of the ELB"
  value       = "${element(concat(aws_elb.hubble_elb.*.id, list("")), 0)}"
}

output "hubble_elb_arn" {
  description = "The ARN of the ELB"
  value       = "${element(concat(aws_elb.hubble_elb.*.arn, list("")), 0)}"
}

output "hubble_elb_name" {
  description = "The name of the ELB"
  value       = "${element(concat(aws_elb.hubble_elb.*.name, list("")), 0)}"
}

output "hubble_elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = "${element(concat(aws_elb.hubble_elb.*.dns_name, list("")), 0)}"
}
