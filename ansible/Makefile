ANSIBLE_VARS=group_vars/all.yml

.PHONY: inventory requirements deploy clean

inventory:
	cd ../terraform && terraform output -json > tfoutput.json
	python3 ../scripts/generate_inventory.py
	rm -f ../terraform/tfoutput.json

requirements:
	ansible-galaxy collection install -r requirements.yml

deploy: inventory requirements
	ansible-playbook -i inventory.ini playbook.yml -e "@$(ANSIBLE_VARS)" --ask-vault-pass

clean:
	rm -f inventory.ini