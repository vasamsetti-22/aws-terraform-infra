resource "aws_instance" "apache-instance" {
  ami                         = "ami-079b5e5b3971bd10d"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pvt.id
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.instance-sec.id]
  tags = {
    "name" = "apache-instance"
  }
  user_data_base64 = filebase64("${path.module}/apacheScript.sh")
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.apache-instance.id
  port             = 80
}