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
# This data is provided by the ministry of Health Affairs, India
#


url = "https://volunteer.coronasafe.network/api/reports"
r = requests.get(url)
data = r.json()
data = data['kerala']


url = "https://api.rootnet.in/covid19-in/stats/daily"
r = requests.get(url)
daily_data = r.json()
daily_data = daily_data['data']

#  Formated raw json data to lists
#

dates = []
totalcases = []
keralacases = []

for x in daily_data:
    dates.append(x['day'])
    totalcases.append(x['summary']['total'])
    for y in x['regional']:
        if y['loc'] == 'Kerala':
            keralacases.append(y['confirmedCasesIndian'])


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


# MENU
# and
# Visualisations using various libraries


print('\n##  MENU  ##\n')
print('## 1. Table of District wise data in kerala ')
print('## 2. District wise charts')
print('## 3. Date wise plots of Cases in Kerala and India')

ch = int(input('\n Enter a choice: '))

print('\n')
if ch == 1:
    print('## DISTRICT WISE TABLE \n')
    print(df)

elif(ch == 2):
    plt.figure()
    df.iloc[:, 0].plot(kind='bar', title='Under Observation')

    plt.figure()
    df.iloc[:, 2].plot(kind='bar', title='Total Hospitalised')

    plt.figure()
    df.iloc[:, 4].plot(kind='bar', title='Corona Positive')

    plt.show()

elif(ch == 3):
    plt.figure()
    plt.title('TOTAL CASES IN INDIA [date wise]')
    plt.plot(np.arange(start=10, stop=10 + len(dates)), totalcases)

    plt.figure()
    plt.title('TOTAL CASES IN KERALA [date wise]')
    plt.plot(np.arange(start=10, stop=10 + len(dates)), keralacases)
    plt.show()

else:
    print('Wrong Choice')
