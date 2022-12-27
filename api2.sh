#! /bin/bash
#
BSC_SCAN_APIKEY=$(printenv BSC_SCAN_APIKEY)
#
# Curl from the BscScan API 
bnb_data=$(curl -L "https://api.bscscan.com/api?module=stats&action=bnbprice&apikey=$BSC_SCAN_APIKEY")
#
#bnb_data='{"status":"1","message":"OK","result":{"ethbtc":"0.01765","ethbtc_timestamp":"1669827422","ethusd":"297.32","ethusd_timestamp":"1669827429"}}'
#
#
bnb_btc=$(echo $bnb_data | grep -oP '(?<=ethbtc":")[\d|.]*' | head -1)
bnb_btc_timestamp=$(echo $bnb_data | grep -oP '(?<=ethbtc_timestamp":")[\d|.]*' | head -1)
bnb_usd=$(echo $bnb_data | grep -oP '(?<=ethusd":")[\d|.]*' | head -1)
bnb_usd_timestamp=$(echo $bnb_data | grep -oP '(?<=ethusd_timestamp":")[\d|.]*' | head -1)
#
# BDD Insert
./BDD/db_insert.sh 'data_btc' ";`date`" $bnb_btc
./BDD/db_insert.sh 'data_usd' ";`date`" $bnb_usd

# Run the html generator script
./teste $bnb_usd
