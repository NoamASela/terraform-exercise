provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-43a15f3e"
  instance_type = "t2.micro"

  #user_data is being executed on instance first boot
  user_data = "${file("data\\user-data.sh")}"

  #Provisioners are used to execute scripts on a local or remote machine as part of resource creation or destruction. 
  provisioner "local-exec" {
    #there it also remote-exec
    command = "echo ${aws_instance.web.public_ip} > ip_address.txt"
  }

  tags {
    Name      = "web-1"
    Excercise = "ex2"
  }
}
