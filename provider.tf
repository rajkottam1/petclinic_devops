provider "aws" {
  #access_key = "${var.aws_access_key}"
  #secret_key = "${var.aws_secret_key}"
  access_key = ""
   secret_key = ""
  #shared_credentials_file = "${var.credentialsfile}"
  region     = "${var.region}"
}
