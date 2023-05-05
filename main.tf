resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "vpc"
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "intuitive-cloud-example-bucket"

  tags = {
    Name        = "bucket"
    Environment = "dev"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "subnet1"
  }
}

resource "aws_security_group" "ec2_security_group" {
  name        = "ec2_security_group"
  description = "intentially left blank"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "ec2_security_group"
  }
}

resource "aws_ebs_volume" "data_vol_1" {
        availability_zone = data.aws_availability_zones.available.names[0]
        size = 30
}

resource "aws_volume_attachment" "vol-attach-vol_1" {
        device_name = "/dev/sdc"
        volume_id = "${aws_ebs_volume.data_vol_1.id}"
        instance_id = "${aws_instance.instance_1.id}"
}

resource "aws_ebs_volume" "data_vol_2" {
        availability_zone = data.aws_availability_zones.available.names[0]
        size = 30
}

resource "aws_volume_attachment" "vol-attach-vol_2" {
        device_name = "/dev/sdc"
        volume_id = "${aws_ebs_volume.data_vol_2.id}"
        instance_id = "${aws_instance.instance_2.id}"
}

resource "aws_instance" "instance_1" {
  ami           = var.ami
  availability_zone = data.aws_availability_zones.available.names[0]
  instance_type = var.instance_type
  security_groups = ["${aws_security_group.ec2_security_group.name}"]
  key_name = "privatekey"
  tags = {
    Name  = "instance-1"
  }

}

resource "aws_instance" "instance_2" {
  ami           = var.ami
  availability_zone = data.aws_availability_zones.available.names[0]
  instance_type = var.instance_type
  security_groups = ["${aws_security_group.ec2_security_group.name}"]
  key_name = "privatekey"
  tags = {
    Name  = "instance-2"
  }

}