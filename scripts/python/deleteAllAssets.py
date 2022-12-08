import os
import mux_python
from mux_python.rest import ApiException
import time

class color():
    BOLD = '\033[1m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    GREEN = '\033[92m' 
    END = '\033[0m'

# Authentication Setup
configuration = mux_python.Configuration()
configuration.username = os.environ['MUX_TOKEN_ID']
configuration.password = os.environ['MUX_TOKEN_SECRET']

# API Client Initialization
assets_api = mux_python.AssetsApi(mux_python.ApiClient(configuration))

# A list of all assetIDs to be deleted
listOfAllAssets = []


# Collect all asset IDs
currentPageNumber = 1
while True:
    list_assets_response = assets_api.list_assets(limit=25, page = currentPageNumber)
    if len(list_assets_response.data) != 0:
        for item in list_assets_response.data:
            listOfAllAssets.append(item.id)
    else:
        break
    currentPageNumber += 1

    
while len(listOfAllAssets) > 0: #confirm you have assets to delete

    print(f"Are you sure you want to delete {color.BOLD}{color.RED} {len(listOfAllAssets)} {color.END} assets? [y/n]")
    deleteAnAsset = input()

    while deleteAnAsset.lower().strip() in ['y','n']:
        if deleteAnAsset == 'n': 
            exit(0)            
        else:
            for asset in listOfAllAssets:
                print(f'{color.YELLOW}Deleting Asset ID:{color.END} {asset}')
                asset = assets_api.delete_asset(asset)
                if asset is None: #api returns "none" if successful
                    print("Asset Deleted ✅")
                    time.sleep(1)
                else:
                    print("Error") #error handling to be added
                    exit(1)
            else:
                print(f"{color.GREEN}All deleted!{color.END}")
                exit(0)
    else: 
        print("You must choose Y or N")
else:
    print("No assets in this environment to delete.")
    exit(0)