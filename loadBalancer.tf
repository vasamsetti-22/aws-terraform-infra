resource "aws_lb" "test" {
  name               = "lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.pub.id, aws_subnet.pub2.id]
  security_groups    = [aws_security_group.lb-sg.id]
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}