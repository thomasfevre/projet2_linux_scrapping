#! /bin/bash

BSC_SCAN_APIKEY=$(printenv BSC_SCAN_APIKEY)

#bnb_data=$(curl -L "https://api.bscscan.com/api?module=stats&action=bnbprice&apikey=$BSC_SCAN_APIKEY")

bnb_data='{"status":"1","message":"OK","result":{"ethbtc":"0.01765","ethbtc_timestamp":"1669827422","ethusd":"297.32","ethusd_timestamp":"1669827429"}}'


echo $bnb_data | grep -oP '(?<=ethbtc).[\d]*' | head -1