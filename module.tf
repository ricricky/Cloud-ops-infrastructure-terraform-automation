
#module "ec2" {
#source = "./modules/ec2"
#instance_type = var.instance_type
#ami = data.aws_ami.ubuntu.id
#subnet_id = aws_subnet.public_subnet.id
#vpc_security_group_ids = aws_security_group.ec2_sg.id
#iam_instance_profile = aws_iam_instance_profile.ec2_profile.id


#}