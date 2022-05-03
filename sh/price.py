#!/bin/python3

import sys
import json
import requests

coin = sys.argv[1]

api_url = f"https://api.coingecko.com/api/v3/simple/price?ids={coin}&vs_currencies=usd"
response = requests.get(api_url).text
response = json.loads(response)
response = response[f"{coin}"]["usd"]

print(f"{response}$")
