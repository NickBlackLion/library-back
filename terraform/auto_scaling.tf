resource "aws_autoscaling_group" "ecs_cluster_spot" {
  name_prefix = "${aws_ecs_cluster.library.name}_asg_spot"
  default_cooldown = 300
  health_check_grace_period = 0
  max_size = var.max_spot_instances
  min_size = var.min_spot_instances
  desired_capacity = var.max_spot_instances

  # Use this launch configuration to define “how” the EC2 instances are to be launched
  launch_configuration = aws_launch_configuration.launch_library.name

  lifecycle {
    create_before_destroy = true
  }

  vpc_zone_identifier = [
    aws_subnet.library_subnet_1.id,
    aws_subnet.library_subnet_2.id,
    aws_subnet.library_subnet_3.id
  ]
}
