resource "aws_instance" "MEC2" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0b7d21e84c9923e9e"]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = var.password
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nginx",
      "sudo systemctl start nginx",
    ]
  }
}




