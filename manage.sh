#!/bin/sh

remote_config() {
  terraform remote config \
    -backend=s3 \
    -backend-config="bucket=joewww-terraform" \
    -backend-config="key=network/terraform.tfstate" \
    -backend-config="region=us-east-1"
}


cd terraform/

case "$1" in
  plan)
    remote_config
    terraform remote pull && terraform plan && terraform remote push
  ;;

  apply)
    remote_config
    terraform remote pull && terraform apply && terraform remote push
  ;;

  show)
    remote_config
    terraform show
  ;;

  destroy)
    remote_config
    terraform remote pull && terraform destroy -force && terraform remote push
  ;;
  *)
    echo "Usage: $0 <plan/apply/show/destroy>"
  exit 1
esac
