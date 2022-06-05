resource "aws_lb_target_group" "tg" {
  name     = "lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  health_check {
   enabled = true
   interval = 10
   path = "/index.html"
   protocol = "HTTP"
   timeout = 5
   healthy_threshold = 2
   unhealthy_threshold = 2
   matcher = "200"
  }

}