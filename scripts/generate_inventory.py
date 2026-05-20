import json

with open("../terraform/tfoutput.json") as f:
    data = json.load(f)

ips = data["web_external_ips"]["value"]

with open("../ansible/inventory.ini", "w") as f:
    f.write("[web]\n")

    for ip in ips:
        f.write(f"{ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa\n")