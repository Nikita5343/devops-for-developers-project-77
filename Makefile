TERRAFORM_DIR=terraform
ANSIBLE_DIR=ansible

.PHONY: init fmt validate tfvars plan apply destroy inventory requirements deploy clean

init:
	make -C $(TERRAFORM_DIR) init

fmt:
	make -C $(TERRAFORM_DIR) fmt

validate:
	make -C $(TERRAFORM_DIR) validate

tfvars:
	make -C $(TERRAFORM_DIR) tfvars

plan:
	make -C $(TERRAFORM_DIR) plan

apply:
	make -C $(TERRAFORM_DIR) apply

destroy:
	make -C $(TERRAFORM_DIR) destroy

inventory:
	make -C $(ANSIBLE_DIR) inventory

requirements:
	make -C $(ANSIBLE_DIR) requirements

deploy:
	make -C $(ANSIBLE_DIR) deploy

clean:
	make -C $(TERRAFORM_DIR) clean
	make -C $(ANSIBLE_DIR) clean
