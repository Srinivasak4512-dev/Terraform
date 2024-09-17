resource "aws_instance" "MyEC2" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.MyEC2.private_ip} >> private_ips.txt"
  }
}




