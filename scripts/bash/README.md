# MUX - Delete all assets
A BASH script to delete all assets within a MUX environment

## How It Works

This script will **DELETE ALL ASSETS** in the environment associated with the Token and Secret IDs. Please use with caution. 

**Bash Requirements**
* [jq](https://stedolan.github.io/jq/download/)

After cloning this repo:
* Edit deleteAllAssets.sh to include your MUX_TOKEN_ID AND MUX_TOKEN_SECRET
* Run ```sh ./deleteAllAssets.sh```
* Follow the prompt

**Currently set to delete only 50 assets at a time**

![delete-all-assets-bash](https://dl.dropboxusercontent.com/9opi0g7gx14u4yx/mux-delete-all-assets-bash.gif)
