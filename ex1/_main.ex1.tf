#uncomment and modify your aws keys, or set them externally using 'aws configure'
provider "aws" {
  #access_key = "ACCESS_KEY_HERE"
  #secret_key = "SECRET_KEY_HERE"
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-43a15f3e" #ubuntu
  instance_type = "t2.micro"

  # tags {
  #   Name      = "web-1"
  #   Excercise = "ex1"
  # }
}
