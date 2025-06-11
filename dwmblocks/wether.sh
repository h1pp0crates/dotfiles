#!/bin/bash

printf "Kyiv: ";curl -s "https://api.openweathermap.org/data/2.5/weather?q=Kyiv&appid=${WETHER_API}&units=metric" | awk -F '"' '{print $31,$33}' | awk -F'[:, ]+' '{print $2, "(" $3 ")"}'
