resource "aws_eip" "ip_pub" {
  vpc      = true
  tags = {
    Name = "${var.user_name}-eip"
  }
}
