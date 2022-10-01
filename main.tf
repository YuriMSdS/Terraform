provider "aws" {
version= "~> 2.0"
region ="us-east-1"
} 
resource "aws_instance" "name" {
 instance_type = "t2.micro"
 ami = "ami-05fa00d4c63e32376" 
}
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "yuri"
  password             = "Ym319733"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
resource "aws_route53_health_check" "name" {
  fqdn              = "aws.com"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"

  tags = {
    Name = "tf-test-health-check"
  }
}
resource "aws_route53_health_check" "parent" {
  type                   = "CALCULATED"
  child_health_threshold = 1

  tags = {
    Name = "tf-test-calculated-health-check"
  }
}
resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "network"
  subnets = ["subnet-05f5e985387596763"]
  enable_deletion_protection = true

}