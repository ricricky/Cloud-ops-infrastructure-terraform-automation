output "ec2_public_ip" {
  description = "public ip of ec2"
  value       = aws_instance.web_server.public_ip

}

output "alb_dns_name" {
  description = "Domain name of application load balancer"
  value       = aws_lb.web_alb.dns_name

}

output "vpc_id" {
  description = "vpc id"
  value       = aws_vpc.main_vpc

}


output "public_subnet" {
  description = "Public_subnet_1"
  value       = aws_subnet.public_subnet.id

}

output "public_subnet_2" {
  description = "Public_subnet_2"
  value       = aws_subnet.public_subnet_2.id

}

output "target_group_arn" {
  description = "Target_group_arn"
  value       = aws_lb_target_group.web_tg.arn

}