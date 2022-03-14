resource "aws_launch_configuration" "example-launchconfig" {
  name_prefix     = var.launch_config_name
  image_id        = var.AMIS
  # instance_type   = "t2.micro"
  instance_type = "t3a.micro"
  spot_price    = "0.001"
  key_name        = var.key_name
  security_groups = var.security_group_id
  iam_instance_profile = "arn:aws:iam::201043775914:instance-profile/aws-elasticbeanstalk-ec2-role" 
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                      = var.auto_scaling_group_name
  vpc_zone_identifier       = var.vpc_zone_identifier
  launch_configuration      = aws_launch_configuration.example-launchconfig.name
  min_size                  = 2
  max_size                  = 4
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true

  tag {
    key                 = "Name"
    value               = var.tag_value
    propagate_at_launch = true
  }
  tag {
    key                 = "ENVIRONMENT"
    value               = "QA"
    propagate_at_launch = true
  }
  
}

resource "aws_autoscaling_policy" "example" {
  name = var.auto_scaling_policy_name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 70.0
  }
    autoscaling_group_name = aws_autoscaling_group.example-autoscaling.name
    policy_type            = "TargetTrackingScaling"
}


resource "aws_lb_target_group" "test" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.example-autoscaling.id
  lb_target_group_arn   = aws_lb_target_group.test.arn
}
