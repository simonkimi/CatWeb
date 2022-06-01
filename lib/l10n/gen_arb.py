import yaml
import json
import os


def yaml_to_json(yaml_file):
    json_struct = {}
    yaml_struct: dict = yaml.load(yaml_file, Loader=yaml.FullLoader)
    for key, value in yaml_struct.items():
        if type(value) is str:
            json_struct[key] = value
        if type(value) is dict:
            if 'text' in value:
                json_struct[key] = value['text']
            attribute = {}
            for attribute_key, attribute_value in value.items():
                if attribute_key == 'placeholders' or attribute_key == 'attrs':
                    placeholders = {}
                    for attr in attribute_value:
                        if type(attr) is str:
                            placeholders[attr] = {}
                        elif type(attr) is dict:
                            for k, v in attr.items():
                                placeholders[k] = v
                    attribute['placeholders'] = placeholders
                elif attribute_key == 'text':
                    pass
                else:
                    attribute[attribute_key] = attribute_value
            json_struct[f'@{key}'] = attribute
    return json.dumps(json_struct)


for root, dirs, files in os.walk('..'):
    for file in files:
        if file.endswith('.yaml') or file.endswith('.yml'):
            with open(file, 'r', encoding='utf-8') as f:
                data = yaml_to_json(f)
                with open('../gen/l10n/' + file.split('.')[0] + '.arb', 'w') as f2:
                    f2.write(data)
