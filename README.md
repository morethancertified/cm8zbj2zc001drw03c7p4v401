**Ticket Type:** Task \
**Title:** Refactoring AWS Resources into Modules \
**Assignee:** You \
**Reporter:** Derek Morgan \
**Priority:** High \
**Labels:** Terraform, AWS, Modules \
**Epic Link:** AWS Expansion \
**Sprint:** Sprint 01/refactoring

**Description**:

When this project was started, it was fairly simple with only a few resources. We're now growing, and we need to refactor our code to make it more maintainable and reusable. To achieve this, we need to refactor our code from one large configuration into smaller, reusable modules. You're provided with a set of Terraform files. We want to create a networking module and a compute module out of the files available. The resources are already split up in the files, but we need to move them into the appropriate modules. For attributes that need to be shared, reference the other module appropriately.  

> **Note:** If the `terraform validate` command fails, all tasks in the lab will fail!

**Implementation Notes**:

Feel free to use code from previous labs. The values aren’t as important as the concepts.

- <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/html" target="_blank">AWS Provider Docs</a>
- <a href="https://developer.hashicorp.com/terraform/language/functions/csvdecode" target="_blank">TODO</a>
- <a href="https://developer.hashicorp.com/terraform/language/values/locals" target="_blank">TODO</a>