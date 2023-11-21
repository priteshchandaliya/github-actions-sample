provider "aws" {
  region = "us-east-1"  # Change this to your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0230bd60aa48260c6"  # Ubuntu, change as needed
  instance_type = "t2.medium"  # Change to your desired instance type

  user_data = <<-EOF
              #!/bin/bash
              echo 'CloudLabs12$' | sudo passwd ec2-user --stdin
              echo 'PasswordAuthentication yes' | sudo tee -a /etc/ssh/sshd_config
              sudo systemctl restart sshd
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo usermod -aG docker ec2-user
              EOF

  tags = {
    Name = "nginx-instance"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "CloudLabs12$"
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
