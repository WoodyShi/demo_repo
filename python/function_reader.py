import pandas as pd
# import re

df = pd.read_csv('python/data/data_2.csv', header=None, encoding='utf-8')

results = []

for _, row in df.iterrows():
    formula = row['Formula']
    value_dict = {}

    for col in df.columns:
        if col.startswith('值'):
            value_dict[col] = ''
