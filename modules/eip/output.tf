output "eip_pub_ip" {
  value = aws_eip.ip_pub.public_ip
}

output "eip_id" {
  value = aws_eip.ip_pub.id
}