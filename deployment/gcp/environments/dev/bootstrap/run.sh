#!/bin/sh

terraform init
terraform apply --auto-approve

TFSTATE_FILE='terraform.tfstate'
TFSTATE_BOOTSTRAP_BUCKET_PREFIX="bootstrap"
GCS_BACKEND_PREFIX="dev"
TFSTATE_BOOTSTRAP_BUCKET_URL=$(terraform output -state="$TFSTATE_FILE" -json | jq -r .tfstate_bucket.value.url)
TFSTATE_BOOTSTRAP_BUCKET_NAME=$(terraform output -state="$TFSTATE_FILE" -json | jq -r .tfstate_bucket.value.name)

gsutil cp "$TFSTATE_FILE" "$TFSTATE_BOOTSTRAP_BUCKET_URL/$TFSTATE_BOOTSTRAP_BUCKET_PREFIX/default.tfstate"

cat << EOF > ../backend.tf
terraform {
  backend "gcs" {
    bucket = "$TFSTATE_BOOTSTRAP_BUCKET_NAME"
    prefix = "$GCS_BACKEND_PREFIX"
  }
}

data "terraform_remote_state" "bootstrap" {
    backend = "gcs"
    config = {
      bucket = "${TFSTATE_BOOTSTRAP_BUCKET_NAME}"
      prefix = "${TFSTATE_BOOTSTRAP_BUCKET_PREFIX}"
    }  
}
EOF
