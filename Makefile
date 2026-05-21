TERRAFORM_DIR=terraform
ANSIBLE_DIR=ansible

TF_VARS_VAULT=$(ANSIBLE_DIR)/terraform-secrets.yml
BACKEND_VAULT=$(ANSIBLE_DIR)/backend.env
ANSIBLE_VARS=$(ANSIBLE_DIR)/datadog-vars.yml

init:
	ansible-vault view $(BACKEND_VAULT) > .backend.env.tmp
	bash -c 'source .backend.env.tmp && cd $(TERRAFORM_DIR) && terraform init -reconfigure'
	rm -f .backend.env.tmp

fmt:
	cd $(TERRAFORM_DIR) && terraform fmt

validate:
	cd $(TERRAFORM_DIR) && terraform validate

tfvars:
	ansible-vault view $(TF_VARS_VAULT) > $(TERRAFORM_DIR)/secret.auto.tfvars

plan: tfvars
	cd $(TERRAFORM_DIR) && terraform plan

apply: tfvars
	cd $(TERRAFORM_DIR) && terraform apply -auto-approve

inventory:
	cd $(TERRAFORM_DIR) && terraform output -json > tfoutput.json
	cd $(ANSIBLE_DIR) && python3 ../scripts/generate_inventory.py
	rm -f $(TERRAFORM_DIR)/tfoutput.json

requirements:
	ansible-galaxy collection install -r $(ANSIBLE_DIR)/requirements.yml

deploy: inventory requirements
	ansible-playbook -i $(ANSIBLE_DIR)/inventory.ini $(ANSIBLE_DIR)/playbook.yml -e "@$(ANSIBLE_VARS)" --ask-vault-pass

destroy: tfvars
	cd $(TERRAFORM_DIR) && terraform destroy -auto-approve

clean:
	rm -f $(TERRAFORM_DIR)/secret.auto.tfvars
	rm -f .backend.env.tmp
	rm -f $(TERRAFORM_DIR)/tfoutput.json
	rm -f $(ANSIBLE_DIR)/inventory.ini