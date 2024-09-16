
resource "aws_instance" "terraform" {
  ami                    = var.ami_id #left side and right side names need not be same
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id] #List of security group ID's, security group is String
  tags                   = var.tags

}

resource "aws_security_group" "allow_ssh_terraform" {
  name        = var.sg_name # allow-sshh is already there in my account
  description = var.sg_description


  # usally we allow everthing in egress
  # ingress we can as block
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allow for everyone
  }

  egress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.ingress_cidr # Allow from everyone
  }

  tags = var.tags
}







