# Create EC2 instances
resource "aws_instance" "sangeethawebserver1" {
  ami           = "ami-0c91f4476780c2eaf"  # Replace with the desired Amazon Linux AMI ID
  instance_type = "t2.micro"
  key_name      = "SangeethaKeyPair"  # Replace with the name of your keypair

  associate_public_ip_address = true
  subnet_id                   = "subnet-29ed7170"  # Replace with the ID of your existing public subnet
  vpc_security_group_ids      = ["sg-0dd65e48722662e22"]  # Replace with the ID of your existing security group

  tags = {
    Name = "ws-san-1"
  }
}

resource "aws_instance" "sangeethawebserver2" {
  ami           = "ami-0c91f4476780c2eaf"  # Replace with the desired Amazon Linux AMI ID
  instance_type = "t2.micro"
  key_name      = "SangeethaKeyPair"  # Replace with the name of your keypair

  associate_public_ip_address = true
  subnet_id                   = "subnet-29ed7170"  # Replace with the ID of your existing public subnet
  vpc_security_group_ids      = ["sg-0dd65e48722662e22"]  # Replace with the ID of your existing security group

  tags = {
    Name = "ws-san-2"
  }
}

#AnsibleServer
resource "aws_instance" "ansibleserver" {
  ami                    = "ami-0c91f4476780c2eaf"  # Replace with your desired Amazon Linux AMI ID
  instance_type          = "t2.micro"
  key_name               = "SangeethaKeyPair"      # Replace with your keypair name
  associate_public_ip_address = true
  subnet_id              = "subnet-29ed7170"  # Replace with your existing public subnet ID
  vpc_security_group_ids = ["sg-0dd65e48722662e22"]  # Replace with your existing security group ID
  
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install pip -y
    sudo python3 -m pip install --user ansible
    EOF

  tags = {
    Name = "Ansibleserver"
  }
}
