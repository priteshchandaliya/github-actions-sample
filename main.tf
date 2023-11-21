provider "aws" {
  region = "us-east-1"  # Change this to your desired region
  shared_credentials_file = "/root/.aws/credentials"
  version                 = "~> 3.0"  # Set the version explicitly
}

resource "aws_instance" "example" {
  ami           = "ami-053b0d53c279acc90"  # Ubuntu, change as needed
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
