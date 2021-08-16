# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
1. Clone this repository

2. Create your infrastructure as code

3. Update this README to reflect how someone would use your code.

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions
####1. Deploy the Packer image using the provided Packer template

In order to configure the environment variables use this snippet:
```
export ARM_CLIENT_ID=YOUR_ARM_CLIENT_ID
export ARM_CLIENT_SECRET=YOUR_ARM_CLIENT_SECRET
export ARM_SUBSCRIPTION_ID=YOUR_ARM_SUBSCRIPTION_ID
export ARM_TENANT_ID=YOUR_ARM_TENANT_ID
```
In order to retrieve the needed values be sure to follow [this tutorial](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret).

Create a resource group in Azure:
```
az group create -n tagging-policy-rg -l eastus
```

Create a policy in Azure:
```
az policy definition create --name allResourcesMustHaveTags --rules azure_policy_all_indexed_resources_in_subscription_must_have_tags.json
```

Deploy the Packer image:  
```packer build server.json```

####2. Deploy the infrastructure using the provided Terraform template

Initialize Terraform:  
```terraform init```

Prepare the plan:  
```terraform plan -out solution.plan```

Deploy the plan:  
```terraform apply solution.plan```

### Output
```
[0m[1mazurerm_resource_group.main: Refreshing state... [id=/subscriptions/MY_SUBSCRIPTION/resourceGroups/prefix-resources][0m
[0m[1mazurerm_virtual_network.main: Refreshing state... [id=/subscriptions/MY_SUBSCRIPTION/resourceGroups/prefix-resources/providers/Microsoft.Network/virtualNetworks/prefix-netwo
rk][0m
[0m[1mazurerm_public_ip.main: Refreshing state... [id=/subscriptions/MY_SUBSCRIPTION/resourceGroups/prefix-resources/providers/Microsoft.Network/publicIPAddresses/prefix-publicIp]
[0m
[0m[1mazurerm_subnet.internal: Refreshing state... [id=/subscriptions/MY_SUBSCRIPTION/resourceGroups/prefix-resources/providers/Microsoft.Network/virtualNetworks/prefix-network/su
bnets/internal][0m
[0m[1mazurerm_network_interface.main: Refreshing state... [id=/subscriptions/MY_SUBSCRIPTION/resourceGroups/prefix-resources/providers/Microsoft.Network/networkInterfaces/prefix-n
ic][0m
[0m
[1m[36mNote:[0m[1m Objects have changed outside of Terraform[0m

[0mTerraform detected the following changes made outside of Terraform since the last "terraform apply":

[1m  # azurerm_subnet.internal[0m has been changed[0m[0m
[0m  [33m~[0m[0m resource "azurerm_subnet" "internal" {
        [1m[0mid[0m[0m                                             = "/subscriptions/MY_SUBSCRIPTION/resourceGroups/prefix-resources/providers/Microsoft.Network/virtualNetworks/
prefix-network/subnets/internal"
        [1m[0mname[0m[0m                                           = "internal"
      [32m+[0m [0m[1m[0mservice_endpoint_policy_ids[0m[0m                    = []
      [32m+[0m [0m[1m[0mservice_endpoints[0m[0m                              = []
        [90m# (6 unchanged attributes hidden)[0m[0m
    }
[1m  # azurerm_virtual_network.main[0m has been changed[0m[0m
[0m  [33m~[0m[0m resource "azurerm_virtual_network" "main" {
        [1m[0mid[0m[0m                    = "/subscriptions/MY_SUBSCRIPTION/resourceGroups/prefix-resources/providers/Microsoft.Network/virtualNetworks/prefix-network"
        [1m[0mname[0m[0m                  = "prefix-network"
      [33m~[0m [0m[1m[0msubnet[0m[0m                = [
          [32m+[0m [0m{
              [32m+[0m [0maddress_prefix = "10.0.0.0/24"
              [32m+[0m [0mid             = "/subscriptions/MY_SUBSCRIPTION/resourceGroups/prefix-resources/providers/Microsoft.Network/virtualNetworks/prefix-network/subnets/inte
rnal"
              [32m+[0m [0mname           = "internal"
              [32m+[0m [0msecurity_group = ""
            },
        ]
      [32m+[0m [0m[1m[0mtags[0m[0m                  = {}
        [90m# (6 unchanged attributes hidden)[0m[0m
    }
[1m  # azurerm_network_interface.main[0m has been changed[0m[0m
[0m  [33m~[0m[0m resource "azurerm_network_interface" "main" {
        [1m[0mid[0m[0m                            = "/subscriptions/MY_SUBSCRIPTION/resourceGroups/prefix-resources/providers/Microsoft.Network/networkInterfaces/prefix-nic"
        [1m[0mname[0m[0m                          = "prefix-nic"
      [32m+[0m [0m[1m[0mtags[0m[0m                          = {}
        [90m# (9 unchanged attributes hidden)[0m[0m

        [90m# (1 unchanged block hidden)[0m[0m
    }
[1m  # azurerm_public_ip.main[0m has been changed[0m[0m
[0m  [33m~[0m[0m resource "azurerm_public_ip" "main" {
        [1m[0mid[0m[0m                      = "/subscriptions/MY_SUBSCRIPTION/resourceGroups/prefix-resources/providers/Microsoft.Network/publicIPAddresses/prefix-publicIp"
      [32m+[0m [0m[1m[0mip_tags[0m[0m                 = {}
        [1m[0mname[0m[0m                    = "prefix-publicIp"
        [1m[0mtags[0m[0m                    = {
            "environment" = "test"
        }
        [90m# (10 unchanged attributes hidden)[0m[0m
    }
[1m  # azurerm_resource_group.main[0m has been changed[0m[0m
[0m  [33m~[0m[0m resource "azurerm_resource_group" "main" {
        [1m[0mid[0m[0m       = "/subscriptions/MY_SUBSCRIPTION/resourceGroups/prefix-resources"
        [1m[0mname[0m[0m     = "prefix-resources"
      [32m+[0m [0m[1m[0mtags[0m[0m     = {}
        [90m# (1 unchanged attribute hidden)[0m[0m
    }

Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or respond to these changes.
[90m
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
[0m

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  [32m+[0m create
[0m
Terraform will perform the following actions:

[1m  # azurerm_linux_virtual_machine.main[0m will be created[0m[0m
[0m  [32m+[0m[0m resource "azurerm_linux_virtual_machine" "main" {
      [32m+[0m [0m[1m[0madmin_password[0m[0m                  = (sensitive value)
      [32m+[0m [0m[1m[0madmin_username[0m[0m                  = "username"
      [32m+[0m [0m[1m[0mallow_extension_operations[0m[0m      = true
      [32m+[0m [0m[1m[0mcomputer_name[0m[0m                   = (known after apply)
      [32m+[0m [0m[1m[0mdisable_password_authentication[0m[0m = false
      [32m+[0m [0m[1m[0mextensions_time_budget[0m[0m          = "PT1H30M"
      [32m+[0m [0m[1m[0mid[0m[0m                              = (known after apply)
      [32m+[0m [0m[1m[0mlocation[0m[0m                        = "eastus"
      [32m+[0m [0m[1m[0mmax_bid_price[0m[0m                   = -1
      [32m+[0m [0m[1m[0mname[0m[0m                            = "prefix-vm"
      [32m+[0m [0m[1m[0mnetwork_interface_ids[0m[0m           = [
          [32m+[0m [0m"/subscriptions/MY_SUBSCRIPTION/resourceGroups/prefix-resources/providers/Microsoft.Network/networkInterfaces/prefix-nic",
        ]
      [32m+[0m [0m[1m[0mplatform_fault_domain[0m[0m           = -1
      [32m+[0m [0m[1m[0mpriority[0m[0m                        = "Regular"
      [32m+[0m [0m[1m[0mprivate_ip_address[0m[0m              = (known after apply)
      [32m+[0m [0m[1m[0mprivate_ip_addresses[0m[0m            = (known after apply)
      [32m+[0m [0m[1m[0mprovision_vm_agent[0m[0m              = true
      [32m+[0m [0m[1m[0mpublic_ip_address[0m[0m               = (known after apply)
      [32m+[0m [0m[1m[0mpublic_ip_addresses[0m[0m             = (known after apply)
      [32m+[0m [0m[1m[0mresource_group_name[0m[0m             = "prefix-resources"
      [32m+[0m [0m[1m[0msize[0m[0m                            = "Standard_D2s_v3"
      [32m+[0m [0m[1m[0mvirtual_machine_id[0m[0m              = (known after apply)
      [32m+[0m [0m[1m[0mzone[0m[0m                            = (known after apply)

      [32m+[0m [0mos_disk {
          [32m+[0m [0m[1m[0mcaching[0m[0m                   = "ReadWrite"
          [32m+[0m [0m[1m[0mdisk_size_gb[0m[0m              = (known after apply)
          [32m+[0m [0m[1m[0mname[0m[0m                      = (known after apply)
          [32m+[0m [0m[1m[0mstorage_account_type[0m[0m      = "Standard_LRS"
          [32m+[0m [0m[1m[0mwrite_accelerator_enabled[0m[0m = false
        }

      [32m+[0m [0msource_image_reference {
          [32m+[0m [0m[1m[0moffer[0m[0m     = "UbuntuServer"
          [32m+[0m [0m[1m[0mpublisher[0m[0m = "Canonical"
          [32m+[0m [0m[1m[0msku[0m[0m       = "18.04-LTS"
          [32m+[0m [0m[1m[0mversion[0m[0m   = "latest"
        }
    }

[0m[1mPlan:[0m 1 to add, 0 to change, 0 to destroy.
[0m[90m
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
[0m

```
