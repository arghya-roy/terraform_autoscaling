module "auto_scaling_1" {
  source = "./modules/auto_scaling"
  AMIS = "ami-0e0ff68cb8e9a188a"
  key_name = "name" 
  security_group_id = ["sg-0620f3c71c8548d8d"]
  vpc_zone_identifier = ["subnet-0ddf28d2601d532d3", "subnet-0000ded779076ac88"]
  load_balancer_arn = "arn:aws:elasticloadbalancing:ap-south-1:201043775914:loadbalancer/app/lb1/083aa011debba12e"
  vpc_id = "vpc-084b6ab5c7f8733f7"
  tag_value = "arghya"
  auto_scaling_group_name = "name1"
  auto_scaling_policy_name = "name1"
  launch_config_name = "name1"
  target_group_name = "name1"
}

module "auto_scaling_2" {
  source = "./modules/auto_scaling"
  AMIS = "ami-0e0ff68cb8e9a188a"
  key_name = "new1" 
  security_group_id = ["sg-0620f3c71c8548d8d"]
  vpc_zone_identifier = ["subnet-0ddf28d2601d532d3", "subnet-0000ded779076ac88"]
  load_balancer_arn = "arn:aws:elasticloadbalancing:ap-south-1:201043775914:loadbalancer/app/lb1/083aa011debba12e"
  vpc_id = "vpc-084b6ab5c7f8733f7"
  tag_value = "suvo"
  auto_scaling_group_name = "name2"
  launch_config_name = "name2"
  auto_scaling_policy_name = "name2"
  target_group_name = "name2"
}

module "auto_scaling_3" {
  source = "./modules/auto_scaling"
  AMIS = "ami-0e0ff68cb8e9a188a"
  key_name = "new1" 
  security_group_id = ["sg-0620f3c71c8548d8d"]
  vpc_zone_identifier = ["subnet-0ddf28d2601d532d3", "subnet-0000ded779076ac88"]
  load_balancer_arn = "arn:aws:elasticloadbalancing:ap-south-1:201043775914:loadbalancer/app/lb1/083aa011debba12e"
  vpc_id = "vpc-084b6ab5c7f8733f7"
  tag_value = "suvo"
  auto_scaling_group_name = "name3"
  launch_config_name = "name3"
  auto_scaling_policy_name = "name3"
  target_group_name = "name3"
}