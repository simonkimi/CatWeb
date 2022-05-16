import json5
import json
import os

for root, dirs, files in os.walk('.'):
    for file in files:
        if file.endswith('.json5'):
            with open(file, 'r', encoding='utf-8') as f:
                try:
                    data = json.dumps(json5.load(f))
                    with open(file.split('.')[0] + '.arb', 'w') as f2:
                        f2.write(data)
                except Exception as e:
                    print('Unexpected json5:', e)