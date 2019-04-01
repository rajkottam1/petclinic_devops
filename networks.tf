provider "aws" {
  #access_key = "${var.aws_access_key}"
  #secret_key = "${var.aws_secret_key}"
  access_key = "AKIA3WFZTV3XF766XPUV"
   secret_key = "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"
  #shared_credentials_file = "${var.credentialsfile}"
  region     = "${var.region}"
}
resource "aws_vpc" "terraformmain" {
    cidr_block = "${var.vpc-fullcidr}"
   #### this 2 true values are for use the internal vpc dns resolution
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
      Name = "My terraform vpc"
    }
}
