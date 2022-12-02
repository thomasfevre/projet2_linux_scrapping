# Project linux scrapping

some description

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
