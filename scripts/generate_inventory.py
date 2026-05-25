import json
from jinja2 import Environment, FileSystemLoader

with open("../terraform/tfoutput.json") as f:
    data = json.load(f)

ips = data["web_external_ips"]["value"]

env = Environment(
    loader=FileSystemLoader("../ansible/templates")
)

template = env.get_template("inventory.ini.tpl")

rendered_inventory = template.render(ips=ips)

with open("../ansible/inventory.ini", "w") as f:
    f.write(rendered_inventory)