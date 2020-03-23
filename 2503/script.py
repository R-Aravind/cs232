#!/usr/bin/env python


# Import Necessary Libraries
#

import requests
import pandas as pd
import numpy as np
from pandas.io.json import json_normalize
import matplotlib.pyplot as plt

# CONSUMING THE API FROM coronasafe.network to get live data
# a GET request is sent to the url which returns a json response

url = "https://volunteer.coronasafe.network/api/reports"
r = requests.get(url)
data = r.json()
data = data['kerala']


# The response is cleaned and formatted into NumPy arrays of Required shape
#

districts = list(data.keys())
labels = list(data[districts[0]].keys())


district_data = []

for d in districts:
    district_data.append(np.array(json_normalize(data[d])))

# Reshape and Print the Data
#

district_data = np.array(district_data)
district_data = district_data.reshape((14, 7))

df = pd.DataFrame(district_data, index=districts, columns=labels)
print(df)

# Visualised the Data
#

plt.figure()
df.iloc[:, 0].plot(kind='bar', title='Under Observation')

plt.figure()
df.iloc[:, 2].plot(kind='bar', title='Total Hospitalised')

plt.figure()
df.iloc[:, 4].plot(kind='bar', title='Corona Positive')

plt.show()
