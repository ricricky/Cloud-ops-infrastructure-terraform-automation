resource "aws_instance" "web_server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  subnet_id                   = var.iam_instance_profile
  iam_instance_profile        = var.iam_instance_profile
  associate_public_ip_address = true

  user_data = <<-EOF
  #!/bin/bash

  apt update -y
  apt install docker.io -y
  systemctl start docker
  systemctl enable docker
  docker run -d \
  --name nginx-container \
  -p 80:80 \
  nginx
  EOF

  tags = {
    Name = "Cloudops-web-server"
  }

}