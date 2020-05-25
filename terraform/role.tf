resource "aws_iam_role" "library_role" {
  name = "library_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "library_role_policy_attachmnet" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  role = aws_iam_role.library_role.name
}

resource "aws_iam_role_policy_attachment" "ecs-service-role-attachment" {
    role       = aws_iam_role.library_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

resource "aws_iam_instance_profile" "library_instance_profile" {
  name = "library_instance_profile"
  path = "/"
  role = aws_iam_role.library_role.name
}
