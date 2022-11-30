#bnb_data=$(curl -L "https://api.bscscan.com/api
 #  ?module=stats
  # &action=bnbprice
   #&apikey=YourApiKeyToken")

data=$(printenv BSC_SCAN_APIKEY)
echo $data