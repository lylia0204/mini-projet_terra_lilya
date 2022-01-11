module "ec2" {
  source        = "../modules/ec2"
  user_name        = var.user_name
  type_instance = "t2.micro"
  security_group= "${module.sg.sg_nom}"
  ip_pub = "${module.eip.eip_pub_ip}"
  user = "ubuntu"
}

module "sg" {
  source        = "../modules/sg"
  user_name = "a_supp"
}


module "ebs" {
  source        = "../modules/ebs"
  size = 8
  user_name = ""
}


module "eip" {
  source        = "../modules/eip"
  user_name = ""
}





resource "aws_eip_association" "eip_assoc" {
  instance_id = module.ec2.ec2_id
  allocation_id = module.eip.eip_id
}

resource "aws_volume_attachment" "ebs_to_ec2_att" {
  device_name = "/dev/sdf"
  volume_id   = module.ebs.ebs_volume_id
  instance_id = module.ec2.ec2_id
}



