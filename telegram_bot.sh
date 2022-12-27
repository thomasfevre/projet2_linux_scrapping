#!/bin/bash

GROUP_ID=
BOT_TOKEN=

curl -S --data "text=$1" "https://api.telegram.org/bot/sendMessage?chat_id="
