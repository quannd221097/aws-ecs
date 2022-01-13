data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] 
}

resource "aws_launch_configuration" "ecs_launch_config" {
  name_prefix   = "terraform-lc-example-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  security_groups      = [aws_security_group.ecs_sg.id]
  user_data            = "#!/bin/bash\necho ECS_CLUSTER=my-cluster >> /etc/ecs/ecs.config"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "failure_analysis_ecs_asg" {
  name                 = "asg"
  vpc_zone_identifier  = [aws_subnet.pub_subnet_1.id,aws_subnet.pub_subnet_2.id]
  launch_configuration = aws_launch_configuration.ecs_launch_config.name
  min_size             = 1
  max_size             = 2

  lifecycle {
    create_before_destroy = true
  }
}