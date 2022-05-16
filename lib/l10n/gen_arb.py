import yaml
import json
import os

for root, dirs, files in os.walk('.'):
    for file in files:
        if file.endswith('.yaml'):
            with open(file, 'r', encoding='utf-8') as f:
                try:
                    data = json.dumps(yaml.load(f, Loader=yaml.FullLoader))
                    with open('gen/' + file.split('.')[0] + '.arb', 'w') as f2:
                        f2.write(data)
                except Exception as e:
                    print('Unexpected json5:', e)