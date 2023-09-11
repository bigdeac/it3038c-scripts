#!/bin/bash
# This script downloads covid data and displays it

DATA=$(curl https://api.covidtracking.com/v1/us/current.json)
POSITIVE=$(echo $DATA | jq '.[0].positive')
TODAY=$(date)
HOSPITALIZED=$(echo $DATA | jq '.[0].hospitalized')
DEATHINCREASE=$(echo $DATA | jq '.[0].deathIncrease')
HOSPITALIZEDINCREASE=$(echo $DATA | jq '.[0].hospitalizedIncrease')



echo "On $TODAY, there were $POSITIVE positive COVID cases, $HOSPITALIZED hospitalized, death increased by $DEATHINCREASE, and hospitalizations increased by $HOSPITALIZEDINCREASE "

