# MUX - Delete all assets
Scripts in a variety of languages to delete all assets from an environment

## How It Works

These scripts will **DELETE ALL ASSETS** in the environment associated with the Token and Secret IDs. Please use with caution. 

**Python Requirements**
* Requires [Mux-Python](https://github.com/muxinc/mux-python)
* Python 3.6+

After cloning this repo:
* Edit script to include the desired environments Token and Secret. For more information see the [Mux-Python](https://github.com/muxinc/mux-python) repo. 
* Run ```python deleteAllAssets.py```
* It will calculate how many assets you have in that environment and after confirmation will delete one asset per second.
