provider "aws" {
  region = "us-east-1"  # Change this to your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI, change as needed
  instance_type = "t2.medium"  # Change to your desired instance type

  tags = {
    Name = "nginx-instance"
  }
}
