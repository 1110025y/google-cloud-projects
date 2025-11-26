### 1.Credentialsの指定の仕方
### Providerでも指定はしているが、backendの設定をした場合では以下の設定でCredentialsを指定しないと動かない
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/service-accounts/arched-backup-479208-n1-153182ad3947.json"

### 2.backend.hcl を使う場合
terraform init -backend-config="./config/dev.backend.hcl"

### 3.tfvarsを使う場合
terraform plan -var-file="./config/dev.variable.tfvars"
terraform apply -var-file="./config/dev.variable.tfvars"

terraform fmt -recursive