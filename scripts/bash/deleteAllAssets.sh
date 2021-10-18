#!/bin/bash

MUX_TOKEN_ID=''
MUX_TOKEN_SECRET=''

# finds full path to jq. If not present, echo Link to download
jqPath=$(which jq)
if [[ $? -eq 1 ]]; then 
    echo "Please install JQ"
    echo "https://stedolan.github.io/jq/download/"
    exit 1
fi

#array for all collected IDs
allAssetIDs=('')

LIMIT='50'
PAGE='1'

getAssetID() {
    assetJSON=$(curl --silent https://api.mux.com/video/v1/assets?limit=$LIMIT\&page=$PAGE \
    -X GET \
    -H "Content-Type: application/json" \
    -u $MUX_TOKEN_ID:$MUX_TOKEN_SECRET | $jqPath .data[].id)
}

deleteAnAsset() {
    #convert quoted asset
    asset=$1; 
    asset="${asset#?}"; #remove leading quote
    asset="${asset%?}" #remove trailing quote
    echo "Deleting asset: $asset";
    curl https://api.mux.com/video/v1/assets/$asset \
    -X DELETE \
    -H "Content-Type: application/json" \
    -u $MUX_TOKEN_ID:$MUX_TOKEN_SECRET; 
    
    response=$?
    if [[ $response -eq 0 ]]; then
        printf "Asset Deleted ✅\n"
        
    else
        printf "Error 👎\n"
    fi

    sleep 1
}
   
#get the first $limit amount
getAssetID
allAssetIDs+=$assetJSON #add to array

# Get amount of items to be deleted
arrayCount=0
for num in ${allAssetIDs[@]}; do let "arrayCount++"; done
echo -e "Number of assets to be deleted: $arrayCount"

# confirm deletion
read -p "Are you sure you want to delete these assets? " -n 1 -r

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 0
else
    printf "\n"
    # Loop through asset array and delete
    for asset in ${allAssetIDs[@]}; do
        deleteAnAsset $asset
    done
fi
