#!/bin/bash

API_KEY="026404d3de17740b166956b83f4563df"
CITY="Nuremberg"
UNITS="metric"
URL="http://api.openweathermap.org/data/2.5/weather?q=${CITY}&appid=${API_KEY}&units=${UNITS}"

# Fetch weather data
weather_data=$(curl -s "${URL}")

# Extract temperature and weather icon
temperature=$(echo "$weather_data" | jq '.main.temp' | xargs printf "%.0f")
weather_icon=$(echo "$weather_data" | jq -r '.weather[0].icon')

# Map weather icons to SF Symbols
case $weather_icon in
  "01d") sf_icon="􀆭" ;;  # clear day
  "01n") sf_icon="􀆮" ;;  # clear night
  "02d") sf_icon="􀇐" ;;  # few clouds day
  "02n") sf_icon="􀇑" ;;  # few clouds night
  "03d"|"03n") sf_icon="􀆫" ;;  # scattered clouds
  "04d"|"04n") sf_icon="􀆼" ;;  # broken clouds
  "09d"|"09n") sf_icon="􀇃" ;;  # shower rain
  "10d") sf_icon="􀇂" ;;  # rain day
  "10n") sf_icon="􀇁" ;;  # rain night
  "11d"|"11n") sf_icon="􀇅" ;;  # thunderstorm
  "13d"|"13n") sf_icon="􀇊" ;;  # snow
  "50d"|"50n") sf_icon="􀆳" ;;  # mist
  *) sf_icon="􀇯" ;;      # default icon
esac

# Print the icon and temperature
echo "${sf_icon} ${temperature}°C"