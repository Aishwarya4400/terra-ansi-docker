resource "aws_instance" "aish-ec2" {
 ami = var.AMIS[var.AWS_REGION]
 instance_type = "t2.micro"
 # the VPC subnet
 subnet_id = var.subnet_id 

 # the security group
 vpc_security_group_ids = [aws_security_group.allow-ssh.id]
 # the public SSH key
 key_name = aws_key_pair.mykeypair.key_name
 tags = {
    Name = "aishwarya-Docker"
  }
provisioner "remote-exec" {
  inline = ["echo 'build ssh connection' >> /tmp/file"]
  connection {
        host = self.public_ip
        type = "ssh"
        user = "ubuntu"
        private_key = file("./mykey")
}
}
provisioner "local-exec" {
        command = "ansible-playbook -i ${aws_instance.aish-ec2.public_ip}, --private-key ${var.PATH_TO_PRIVATE_KEY} main.yaml -b"
}
}
