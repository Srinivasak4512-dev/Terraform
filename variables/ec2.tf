resource "aws_security_group" "allow_ssh_terraform" {
  name        = var.sg_name # allow-sshh is already there in my account
  description = var.sg_description


  # usally we allow everthing in egress
  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.ingress_cidr #Allow for everyone
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags


resource "aws_instance" "Terraform" {
  ami                    = var.ami_id # left side and right side names need not to be same
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  

}






