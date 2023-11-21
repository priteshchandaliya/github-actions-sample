provider "aws" {
  region = "us-east-1"  # Change this to your desired region
  shared_credentials_file = "/root/.aws/credentials"
}

resource "aws_instance" "example" {
  ami           = "ami-0230bd60aa48260c6"  # Ubuntu, change as needed
  instance_type = "t2.medium"  # Change to your desired instance type

  tags = {
    Name = "nginx-instance"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "CloudLabs12$"
  }
}
