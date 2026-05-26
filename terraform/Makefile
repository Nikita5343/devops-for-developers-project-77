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
	cd ../ansible && ansible-playbook generate_tfvars.yml --ask-vault-pass

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
