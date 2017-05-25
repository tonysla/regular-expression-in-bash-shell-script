#!/bin/bash

curl http://static.hurstathletics.com/custompages/MBasketball/2016-17/teamstat.htm |
      egrep "td" | cut -d ">" -f 3  > basket_file.txt 

while read line
do
date_col=$(echo $line | egrep -o "^[0-9]+/[0-9]+/[0-9]+")
# code below selects only the city name 
city=$(echo $line | egrep -o "^[A-Z].+" | egrep -v ".[0-9]+" |
             cut -d "," -f 1 | cut -d "&" -f 1 | sed "s/University//")
# code below selects only the state initials
state=$(echo $line | egrep -o "^[A-Z].+" | egrep -v ".[0-9]+" | 
              cut -d "," -f 2 | cut -d " " -f 2 | sed "s/a/A/" | 
              sed "s/Athletic//" | cut -d "." -f 1)
# location variable retrives both city and state data. 
location=$(echo $line | egrep -o "^[A-Z].+" | egrep -v ".[0-9]+" |
                 cut -d "(" -f 1 | cut -d "&" -f 1 | sed "s/,//" | cut -d "." -f 1 |
                 sed "s/McComb Fieldhouse//" | sed -e "s/Pa/PA/g")
# where the games were played
venue=$(echo $line | egrep -o "^[A-Z].+" | egrep -v ".[0-9]+" |
              cut -d "(" -f 2 | cut -d ")" -f 1 | cut -d "&" -f 1 | cut -d "." -f 2 |
              sed "s/,//")
# home team's name
home=$(echo $line | egrep -a "[a-zA-Z] [0-9]" | cut -d "," -f 1 | 
             sed -e "s/[0-9]//g" | sed -e "s/(//g" | sed -e "s/)//g" | sed "s/Pa./PA/")
# home team's result
home_result=$(echo $line | egrep -o "[0-9]+," | cut -d "," -f 1)
# away team's name
away=$(echo $line | egrep -a "[a-zA-Z] [0-9]" | cut -d "," -f 2 |
             sed -e "s/[0-9]//g" | cut -d "&" -f 1 | sed -e "s/(//g" | sed -e "s/)//g")
# away team's result
away_result=$(echo $line | egrep -a "[a-zA-Z] [0-9]" | cut -d "," -f 2 |
                    cut -d "&" -f 1 | egrep -o "[0-9]{2}")

echo $date_col 
echo $city
echo $state
echo $location 
echo $venue 
echo $home 
echo $away 
echo $home_result 
echo $away_result 

done  < basket_file.txt

