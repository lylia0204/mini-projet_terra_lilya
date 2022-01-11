resource "aws_ebs_volume" "volume" {
  availability_zone = "${var.zone_dispo}"
  size              = var.size

  tags = {
    Name = "${var.user_name}-ebs"
  }
}