resource "aws_launch_configuration" "launch_library" {
  image_id = var.instance_ami
  instance_type = "t2.micro"
  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }

  user_data = <<EOF
#!/bin/bash
echo ECS_CLUSTER=${var.cluster_name} >> /etc/ecs/ecs.config;echo ECS_BACKEND_HOST= >> /etc/ecs/ecs.config;
EOF

  security_groups = [aws_security_group.library_security_group.id]
  iam_instance_profile = aws_iam_instance_profile.library_instance_profile.arn

  depends_on = [
    aws_security_group.library_security_group,
    aws_iam_instance_profile.library_instance_profile,
    aws_ecs_cluster.library
  ]

  root_block_device {
    volume_type = "gp2"
    volume_size = 30
    delete_on_termination = true
  }
}
