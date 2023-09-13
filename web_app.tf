/**
** Web application
*/

module "web_application" {
  source                 = "app.terraform.io/tarun_org/ec2-linux-inst/aws"
  version                = "0.0.1-alpha"
  ami                    = "ami-074dc0a6f6c764218"
  client                 = "${var.client}"
  tags                   = "${var.tags}"
  instance_type          = "t2.micro"
  key_name               = "keypair_${var.client.name}"
  vpc_security_group_ids = ["${aws_security_group.webapp.id}"]
  subnet_id              = "${local.aza_private_subnet_id}"
  userDataScript         = base64encode(file(var.userDataScript))
  #userDataScript         = base64encode(templatefile(var.userDataScript.app))



  root_block_device = [
    {
      encrypted   = true
      volume_size = "10"
      volume_type = "gp2"
    },
  ]

  host_prefix = "${var.client.prod_host_prefix}"

  hosts = ["Web03"]

}

module "web_application2" {
  source                 = "app.terraform.io/tarun_org/ec2-linux-inst/aws"
  version                = "0.0.1-alpha"
  ami                    = "ami-074dc0a6f6c764218"
  client                 = "${var.client}"
  tags                   = "${var.tags}"
  instance_type          = "t2.micro"
  key_name               = "keypair_${var.client.name}"
  vpc_security_group_ids = ["${aws_security_group.webapp.id}"]
  subnet_id              = "${local.azb_private_subnet_id}"
  userDataScript         = base64encode(file(var.userDataScript))
 


  root_block_device = [
    {
      encrypted   = true
      volume_size = "10"
      volume_type = "gp2"
    },
  ]

  host_prefix = "${var.client.prod_host_prefix}"

  hosts = ["Web04"]


}
