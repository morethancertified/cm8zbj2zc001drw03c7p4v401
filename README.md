**Ticket Type:** Task \
**Title:** Refactoring AWS Resources into Modules \
**Assignee:** You \
**Reporter:** Derek Morgan \
**Priority:** High \
**Labels:** Terraform, AWS, Modules \
**Epic Link:** AWS Expansion \
**Sprint:** Sprint 01/refactoring

**Description**:

When this project was started, it was fairly simple with only a few resources. We're now growing, and we need to refactor our code to make it more maintainable and reusable. To achieve this, we need to refactor our code from one configuration into smaller, reusable modules. 

You're provided with a set of Terraform files. 
First, create a new directory for the refactored configuration. You can optionally call it "refactored". 
Then, within a modules directory, create a networking module from networking.tf and a compute module from compute.tf.
The modules should be called from a main.tf file in the root of the refactored directory.  
For attributes that need to be shared, reference the respecive module accordingly. 
Ensure any configuration outputs are preserved. 
Use main.tf, outputs.tf, and variables.tf files where appropriate for all configuration.  

> **Note:** If the `terraform validate` command fails, all tasks in the lab will fail!

**Implementation Notes**:

Ensure all resources are moved into the appropriate modules and the modules are named correctly. 

- <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/html" target="_blank">AWS Provider Docs</a>
- <a href="https://developer.hashicorp.com/terraform/language/modules" target="_blank">Terraform Modules</a>