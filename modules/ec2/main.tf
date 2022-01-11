data "aws_ami" "my_ami" {
  most_recent = true
  owners      = ["${var.id_compte_ubuntu}"]

  filter {
    name   = "name"
    values = ["${var.nom_ubuntu_ami}"]
  }
}

resource "aws_instance" "my_ec2" {
  ami               = data.aws_ami.my_ami.id
  instance_type     = var.type_instance
  key_name          = var.key_ssh
  availability_zone = var.zone_dispo
  security_groups   = ["${var.security_group}"]
  tags = {
    Name = "${var.user_name}-ec2"
  }

  provisioner "local-exec" {
    command = " echo PUBLIC IP: ${var.ip_pub} >> ip_ec2.txt"
  }

   #installation de Nginx
  user_data = <<-EOF
      #!/bin/bash
      sudo apt-get update -y
      sudo apt-get -y install nginx
      sudo systemctl enable nginx
      sudo systemctl start nginx
  EOF

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("D:/AJC-FORMATION/Terraform/lilya-kp-ajc.pem")
      host        = self.public_ip
    }
  


}

