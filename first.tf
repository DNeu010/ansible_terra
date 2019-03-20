provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "instance" {
  ami = "ami-0a8e17334212f7052"
  instance_type = "t2.micro"
  key_name = "user8"
  tags = {
    Name = "user8"
  }  
  provisioner "remote-exec" {
    inline = ["sudo apt-get -y install python"]
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("/home/ubuntu/user8.pem")}"
    }
  }
}
