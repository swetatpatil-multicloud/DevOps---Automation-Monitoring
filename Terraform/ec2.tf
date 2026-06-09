resource "aws_instance" "web_server" {
  ami                    = "ami-020979bc2b447912c"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  key_name = "travelmemory-key-v2"

  tags = {
    Name = "travelmemory-web-server"
  }
}

resource "aws_instance" "db_server" {
  ami                    = "ami-020979bc2b447912c"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private.id
  associate_public_ip_address = false
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  key_name = "travelmemory-key-v2"

  tags = {
    Name = "travelmemory-db-server"
  }
}