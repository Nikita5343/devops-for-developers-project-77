TF_VARS_VAULT=../ansible/terraform-secrets.yml
BACKEND_VAULT=../ansible/backend.env

.PHONY: init fmt validate tfvars plan apply destroy clean

init:
	ansible-vault view $(BACKEND_VAULT) > ../.backend.env.tmp
	bash -c 'source ../.backend.env.tmp && terraform init -reconfigure'
	rm -f ../.backend.env.tmp

fmt:
	terraform fmt

validate:
	terraform validate

tfvars:
	ansible-vault view $(TF_VARS_VAULT) > secret.auto.tfvars

plan: tfvars
	terraform plan

apply: tfvars
	terraform apply -auto-approve

destroy: tfvars
	terraform destroy -auto-approve

clean:
	rm -f secret.auto.tfvars
	rm -f ../.backend.env.tmp
	rm -f tfoutput.json