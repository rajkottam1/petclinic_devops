# Devops implementation for a java Project petclinic  in AWS ENVIRONMENT WITH TERRAFORM


Description:
1) vpc with cidr created using network.tf
2) All variables declared in variables.tf
3) public, private subnets
4) internet gateway
5) NAT gateway
6) router tables to map the subnets to gateways
7) sec groups
8) EC2 Instances created as civm in public subnet,appvm  in private subnet




Commands:
1) terraform init
2) terraform plan
3) terraform apply



End Result:
Petclinic is a Spring Boot application built using Maven. You can build a jar file and run it from the command line:


You can then access petclinic here: http://<public_ip>:8080/

Finally you can run terraform destroy. To destroy the instances you created for demo.