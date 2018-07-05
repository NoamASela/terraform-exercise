provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-43a15f3e"
  instance_type = "t2.micro"

  user_data = "${file("data\\user-data.sh")}"

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ip_address.txt"
  }

  #count = 2
  count = "${var.web_instance_count}"

  tags {
    Name = "web-1"
    #Name      = "web-${count.index+1}"

    Excercise = "ex3"
  }
}
