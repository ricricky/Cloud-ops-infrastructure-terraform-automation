data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  subnet_id                   = aws_subnet.public_subnet.id
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = true
  lifecycle {
    ignore_changes = [ami]
  }

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