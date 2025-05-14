provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "ansible_test" {
  ami           = "ami-004a8db9e5e1cf28e"
  instance_type = "t2.micro"
  key_name      = "terraform-key"
  associate_public_ip_address = true

  tags = {
    Name = "ansible-test"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ip.txt"
  }
}
