# az-aks
# Using an Azure Storage account for tfstate files (Not yet Implemented)
# The Storage account is independent of this Terraform set, 
# and is available before running this terraform
# Before 'terraform iniit" do the following
    <!-- Create a file `touch backend.secrets.tfvars` add add following two settings:
    ```
    access_key = "<AccessKey>"
    ```

    The access key is the remote Azure Storage account key.

    Example `backend.secrets.tfvars` file:
    ```
    access_key = "ibt+g4fKJwVGAqOJ4Oy8UrldS15fFn.................."
    ``` -->

## init 
    (terraform init -backend-config="./backend.secrets.tfvars")

```
terraform init 
```

### Workspace setup
please make sure the workspaces hasn't already been configured before running any of the create commands.
```
# confirm
terraform workspace list

# create
terraform workspace new dev
terraform workspace new qa
terraform workspace new tst
terraform workspace new stg
terraform workspace new prd
terraform workspace new sbstg
terraform workspace new sbprd

```
### Plan & Apply
#### Dev
```
# export keyvault values
ansible-vault view vault.json.txt > az.secrets.json
terraform workspace select dev
terraform plan -var-file=terraform.common.tfvars -out="af-dev.tfplan"
terraform apply "af-dev.tfplan"
rm az.secrets.json
```