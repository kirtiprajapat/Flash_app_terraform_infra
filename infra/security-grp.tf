resource "aws_security_group" "Allow_All_SG_Ass" {
 name = "Allow_All_SG_Ass"   
 description =  "ALLOW_ALL_SG_Ass"
 vpc_id = aws_vpc.vpc_for_Ass.id

ingress {
      from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }  

}