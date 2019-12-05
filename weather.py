import json
with open('weather.json', 'r') as fp:
    obj = json.load(fp)
    weather_list = obj["1d"]
    for index in range(len(weather_list)):
       temp = weather_list[index].split(",", 7)
       print(temp[0] + ' ' + temp[2] + ' ' + temp[3])













