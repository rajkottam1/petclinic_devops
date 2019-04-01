resource "aws_key_pair" "demotmp" {
  key_name = "demotmp"
  public_key = "<Public_Key>"
}

resource "aws_instance" "civm" {
  ami           = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.CIserver.id}"]
  key_name = "${var.key_name}"
  tags {
        Name = "civm"
  }
  user_data = <<HEREDOC
  #!/bin/bash

  yum update -y
  yum -y install git
  Yum -y remove *java*
  yum -y install java-1.8.0-openjdk-devel
  wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
  rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
  yum -y install jenkins
  rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
  yum install puppet-server
  cd $HOME
  git clone https://github.com/spring-projects/spring-petclinic.git
  cd spring-petclinic
  ./mvnw package
  java -jar target/*.jar

HEREDOC
}

resource "aws_instance" "appvm" {
  ami           = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "false"
  subnet_id = "${aws_subnet.PrivateAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.Appserver.id}"]
  key_name = "${var.key_name}"
  tags {
        Name = "appvm"
  }
  user_data = <<HEREDOC
  #!/bin/bash
  yum update -y
  rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
  yum install puppet
HEREDOC
}
