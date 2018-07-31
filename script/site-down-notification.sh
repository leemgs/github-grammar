#!/usr/bin/env bash

# @brief A shell script to automatically test if a web site is available
#
#  A Bash script that checks if a site is up or down and emails notifications.
#  This script checkes to see if a website is up/down by pinging the url
#  If there is not response an email will be send via an external SMTP mail server
#  If the site status is down an email will be send when the site is up via /etc/crontab
#
# @date: Jul-29-2018
# @author: Geunsik Lim <leemgs@gmail.com>

# --------------------------------- If needs, modify the below configuration setting ------
# declare the website addresses
websites=( http://invain.mooo.com http://dclab.skku.ac.kr )

# toemail="leemgs@gmail.com zeteman2ya@gmail.com yieom@skku.edu"
toemail="leemgs@gmail.com zeteman2ya@gmail.com"
fromemail="leemgs@gmail.com"

# google stmp account
smtpserver="smtp.gmail.com"
port=587
username="leemgs@gmail.com"
password="YourVerySecretPassword"

# sendmail command is 1, mail command is 0 (by default).
use_sendmail=0

# --------------------------------- Do not edit the below statements ---------------------
# Get the elements out of the array, use this syntax: "${websites[@]}" -- with the quotes
for website in "${websites[@]}"; do
    echo -e "-------------- $website ----------------------"
    subject="${website} - Website down."
    message="To ${toemail}\n\nOoops. Website is down on `date`.\n\nPlease, check your webserver status.\n\n From web-bot."
    
    # @brief Send e-mail with the SMTP protocol of a google account
    function run_smtp_google(){
        echo -e "Starting sendmail command..."
        sendmail -f "$fromemail" -t "$3" -u "$1" -m "$2" -s \
        "$smtpserver:$port" -xu "$username" -xp "$password" -o tls=yes -q
    }
    
    # @brief Send e-mail with the SMTP protocol of a local server
    function run_smtp_local(){
        echo -e "Starting mail command..."
        echo -e "$2" | mail -s "$1" -r "$fromemail" "$3"
    }
    
    # @brief Check dependant packages
    function check_dependency() {
        echo -e "Checking for $1 command..."
        which "$1" 2>/dev/null || {
            echo -e "Please install $1."
            exit 1
        }
    }
    
    # Check a health status of a website with curl command.
    # -s flag (silent),
    # -f flag (fail with exit code on error)
    # -o flag to redirect output
    
    # Main function
    echo -e "Checking site...";
    check_dependency curl
    # check_dependency sendmail
    check_dependency mail
    
    if [[ $use_sendmail == 1 ]]; then
        curl ${website} -s -f -o /dev/null || run_smtp_google "${subject}" "${message}" "${toemail}"
    else
        curl ${website} -s -f -o /dev/null || run_smtp_local  "${subject}" "${message}" "${toemail}"
    fi
done
