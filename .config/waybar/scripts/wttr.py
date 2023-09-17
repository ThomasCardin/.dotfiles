#!/usr/bin/env python3

import json
import requests
from datetime import datetime

WEATHER_CODES = {
    '113': '☀️',
    '116': '⛅️',
    '119': '☁️',
    '122': '☁️',
    '143': '🌫',
    '176': '🌦',
    '179': '🌧',
    '182': '🌧',
    '185': '🌧',
    '200': '⛈',
    '227': '🌨',
    '230': '❄️',
    '248': '🌫',
    '260': '🌫',
    '263': '🌦',
    '266': '🌦',
    '281': '🌧',
    '284': '🌧',
    '293': '🌦',
    '296': '🌦',
    '299': '🌧',
    '302': '🌧',
    '305': '🌧',
    '308': '🌧',
    '311': '🌧',
    '314': '🌧',
    '317': '🌧',
    '320': '🌨',
    '323': '🌨',
    '326': '🌨',
    '329': '❄️',
    '332': '❄️',
    '335': '❄️',
    '338': '❄️',
    '350': '🌧',
    '353': '🌦',
    '356': '🌧',
    '359': '🌧',
    '362': '🌧',
    '365': '🌧',
    '368': '🌨',
    '371': '❄️',
    '374': '🌧',
    '377': '🌧',
    '386': '⛈',
    '389': '🌩',
    '392': '⛈',
    '395': '❄️'
}

response = requests.get("https://wttr.in/Springfield, Manitoba?format=j1")
weather = response.json()

current_condition = weather['current_condition'][0]

data = {
    'text': f"{WEATHER_CODES[current_condition['weatherCode']]} {current_condition['FeelsLikeC']}°",
    'tooltip': f"{current_condition['weatherDesc'][0]['value']} {current_condition['temp_C']}°\n"
               f"Feels like: {current_condition['FeelsLikeC']}°\n"
               f"Wind: {current_condition['windspeedKmph']}Km/h\n"
               f"Humidity: {current_condition['humidity']}%\n"
}

for i, day in enumerate(weather['weather']):
    prefix = "Today, " if i == 0 else "Tomorrow, " if i == 1 else ""
    data['tooltip'] += (f"\n<b>{prefix}{day['date']}</b>\n"
                        f"⬆️ {day['maxtempC']}° ⬇️ {day['mintempC']}° "
                        f" {day['astronomy'][0]['sunrise']}  {day['astronomy'][0]['sunset']}\n")
    
    for hour in day['hourly']:
        time = hour['time'].replace("00", "").zfill(2)
        if i == 0 and int(time) < datetime.now().hour - 2:
            continue
        
        conditions = [f"{cond} {hour[key]}%" for key, cond in {
            "chanceoffog": "Fog", "chanceoffrost": "Frost", "chanceofovercast": "Overcast",  "chanceofrain": "Rain",  "chanceofsnow": "Snow",  "chanceofsunshine": "Sunshine",  "chanceofthunder": "Thunder", "chanceofwindy": "Wind"
        }.items() if int(hour[key]) > 0]
        
        data['tooltip'] += f"{time} {WEATHER_CODES[hour['weatherCode']]} {hour['FeelsLikeC']}° {hour['weatherDesc'][0]['value']}, {', '.join(conditions)}\n"

print(json.dumps(data))