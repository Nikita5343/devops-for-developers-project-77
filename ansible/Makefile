ANSIBLE_VAULT=group_vars/vault.yml

.PHONY: inventory requirements deploy clean

inventory:
	cd ../terraform && terraform output -raw inventory > ../ansible/inventory.ini

requirements:
	ansible-galaxy install -r requirements.yml

deploy: inventory requirements
	ansible-playbook -i inventory.ini playbook.yml -e "@$(ANSIBLE_VAULT)" --ask-vault-pass

clean:
	rm -f inventory.ini
