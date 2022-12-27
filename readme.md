# Project linux scrapping

This project aims to use bash scripts to constantly scrap data from a website (here it is the current price of the BNB crypto asset)
and if there is any "abnormal values", send a message via telegram and add the data into a self-hosted website ( https://fa00-20-43-56-90.eu.ngrok.io )

Objective  
Having up-to-date info from continuous API requests of a website  
  
- I Choosed a website that have some dynamic information - changes each
minute or so, with an API  
- I insert data into a sqlite database and process any anormal values  
- Abnormal fluctuations triggers a warning sent to my phone  
- I have my own running webpage listing historical anomalies too  

Specifications  
• The code run on your online hosted virtual machine (24/7)  
• It is written in bash  
• Website accessible via this link :  
https://fa00-20-43-56-90.eu.ngrok.io 

## notes

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
https://ngrok.com/download 