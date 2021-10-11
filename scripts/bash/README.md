# MUX - Delete all assets
Scripts in a variety of languages to delete all assets from an environment

## How It Works

These scripts will **DELETE ALL ASSETS** in the environment associated with the Token and Secret IDs. Please use with caution. 

**Python Requirements**
* [jq](https://stedolan.github.io/jq/download/)

After cloning this repo:
* Edit deleteAllAssets.sh to include your MUX_TOKEN_ID AND MUX_TOKEN_SECRET
* Run ```sh ./deleteAllAssets.sh```
* Follow the prompt

**Current set to delete 50 assets at a time**


