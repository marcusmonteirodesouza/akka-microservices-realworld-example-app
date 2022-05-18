# ![RealWorld Example App](logo.png)

> ### [Akka](https://doc.akka.io/docs/akka/current/index.html?language=scala&_ga=2.53484269.439219745.1652308534-733480824.1649031211) codebase containing real world examples (CRUD, auth, advanced patterns, etc) that adheres to the [RealWorld](https://github.com/gothinkster/realworld) spec and API.


### [RealWorld](https://github.com/gothinkster/realworld)

# Top-Level Repository

This is the top-level repository containing the common infrastructure provisioning and services as [submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

# How it works

> 

# Getting started

1. Install [terraform](https://www.terraform.io/)
1. Go to `deployment/gcp/environments/dev/bootstrap`. Create `terraform.tfvars` file and [add your variables' definitions](https://www.terraform.io/language/values/variables#variable-definitions-tfvars-files). Run the `run.sh` script.
1. Go to `deployment/gcp/environments/dev`. Create a `terraform.tfvars` file and add your variables' definitions. Run `terraform init` and then `terraform apply`.
