# YOUR VAR VALUE(S)
# example_key = "example_value"
resource_group_name = "jenkins-demo-rg-01"
instance_name       = "Jenkins-Demo"
tags                = { Owner = "Wizard", Purpose = "Demo" }
location            = "EastUS"
admin_user          = "azureuser"
vnet_name           = "jenkins-demo-vnet-01"
subnet_name         = "jenkins-demo-sn-01"
my_ip               = "*"
