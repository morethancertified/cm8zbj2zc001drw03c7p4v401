# EC2 Instances
resource "aws_instance" "web" {
  for_each               = var.instances
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public[each.value].id
  vpc_security_group_ids = [aws_security_group.ec2.id]

  tags = {
    Name = "${var.project_name}-web-${each.key}"
  }
}

# Elastic IP for instances
resource "aws_eip" "web" {
  for_each = aws_instance.web
  instance = each.value.id
  domain   = "vpc"

  tags = {
    Name = "${var.project_name}-eip-${each.key}"
  }
}

# Output the public IPs
output "instance_public_ips" {
  value = { for k, v in aws_eip.web : k => v.public_ip }
}

# Output the instance IDs
output "instance_ids" {
  value = { for k, v in aws_instance.web : k => v.id }
}