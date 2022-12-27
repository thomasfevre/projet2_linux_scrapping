# Project linux scrapping

This project aims to use bash scripts to constantly scrap data from a website (here it is the current price of the BNB crypto asset)
and if there is any "abnormal values", send a message via telegram and add the data into a self-hosted website 

Objective  
Having up-to-date info from continuous API requests of a website  
  
- I choosed a website (bscscan) that have some dynamic information (BNB price) - changes each
minute or so, with an API  
- I insert data into a sqlite database and process any anormal values  
- Abnormal fluctuations triggers a warning sent to my phone  
- I have my own running webpage listing historical anomalies too  

Specifications  
• The code run on your online hosted virtual machine (24/7)  
• It is written in bash  
• Website accessible via this link (if it does not work, please contact me):  
https://266e-20-43-56-90.eu.ngrok.io

## Architecture

- "apiScrap.sh" : Scrapping data & insert into DB, then trigger "anomaly.sh"  
- "anomaly.sh" : Process the spread for the "normal" values, update the website and trigger "telegram_bot.sh" if abnormal values  
- "telegram_bot.sh" : Classic telegram bot  
- "test.html" : html template  
- "projet" : file for sqlite3 database  

## Notes

**How to set and use env variables**  
 Edit the file /home/user/.bashrc  
 Add in the file :  
 ```bash
 "export VARNAME="varValue"  
 ```  
Apply the changes :   
```bash
source .bashrc  
```
Use the variable :
```bash
printenv VARNAME
```
  
**How to run apache on linux**  
install apache  
```bash
sudo apt-get update
sudo apt-get install apache2
```  
start the server if not already started
```bash
sudo service apache2 start
```
  
**Deploy the web site with ngrok**  
  
# Download ngrok

https://ngrok.com/download 

# run ngrok in the background
ngrok http 80 --log=stdout >/dev/null &
# get the public url
PUBLIC_URL=$(curl -sS http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')