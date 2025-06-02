resource "aws_instance" "Flash_app" {
  ami = "ami-0953476d60561c955"
  instance_type = "t3.micro"
#   key_name = "server12"
  vpc_security_group_ids      = [aws_security_group.Allow_All_SG_Ass.id]
  subnet_id = aws_subnet.public_subnet_1_for_Ass.id
  associate_public_ip_address = true
    user_data = filebase64("dep.sh")
    tags = {    
    Name = "Flash_app"
    }

     metadata_options {
    http_endpoint = "enabled"  # Enable the IMDSv2 endpoint
    http_tokens   = "required" # Require the use of IMDSv2 tokens
  }
}

