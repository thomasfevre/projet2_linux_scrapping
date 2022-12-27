#!/bin/bash

# Get the data for the database
avg=$(sqlite3 /home/tfevre/projet2/projet2_linux_scrapping/projet "select AVG(value) from data_usd;")
datas=$(sqlite3 /home/tfevre/projet2/projet2_linux_scrapping/projet "select value from data_usd;")
data=($(echo $datas | grep '[\d|\.]*'))

# Process the normal values spread 
sum=0
for i in `seq 1 ${#data[@]}` ; do
    # redefine variable 'sum' after each iteration of for-loop

    tmp_sum=$(echo ${data[$i-1]} - $avg| bc -l)
    tmp_sum=$(echo "$(echo $tmp_sum ^ 2)" | bc -l)
    sum=$(echo "$sum + $tmp_sum" | bc -l)
done

ecart=$(bc -l <<< "(sqrt($sum / ${#data[@]}) )")

min=$(echo "$avg - (2 * $ecart)" | bc -l)
max=$(echo "$avg + (2 * $ecart)" | bc -l)

# Update the html webpage
touch test.html
cat > test.html << EOF

<!DOCTYPE html>
<html>
<head>
<title>Anormal values for BNB price</title>
</head>
<body>
<h1>Here are all anomaly values for the BNB price</h1></br>
EOF

anomalies_data=$(sqlite3 /home/tfevre/projet2/projet2_linux_scrapping/projet "select * from data_usd where value < $min or value > $max;")

if [[ "$anomalies_data" != "" ]]; then
    echo "<p style='width:18vw;'>" >> test.html
    echo $anomalies_data | grep -oP '(?<=;).*(?= ;|;)|(?<=;).*$' >> test.html
fi

echo '</p>
   </body>
</html>' >> test.html
sudo cp test.html /var/www/html/index.html

# Send a message on Telegram
if [ "$(echo " $1 < $min || $1 > $max " | bc -l )" == 1 ]; then
    message='Le prix du $BNB est anormal :$'$1
    message="$message https://266e-20-43-56-90.eu.ngrok.io"
    /home/tfevre/projet2/projet2_linux_scrapping/telegram_bot.sh "$message"
fi