# NEPI - Nobody Expects Polish Inquisition

## Goals

Prepare sensors based on NERVES to help automate flowers growing process. All data
can be checked in realtime on web app (sensors_hub) based on PHOENIX.

### Currently we are tracking:

* hydration of flowers - this data is aggregated by hour

* precipitation - which is aggregate by hour

* buzzer - which can be used to scarry off intruders :) it can be switch on from web page

### Solution is splitted into two parts

Sensors - which holds code for all devices under NERVEs controll
and web part which uses phoenix to display live and historical data.

Sensors_hub - which aggregates historical data and displays live changes on web.
It is hosted on heroku and can be viewed at [`sensors hub`](https://sensors-hub.herokuapp.com).

## Short demo

[video](https://twitter.com/Dreat_/status/939890791115296768)

### What is happening?

There's Elixir app with Phoenix fronend opened, showing sensor output.
Sensors are connected to raspberry pi. When sensors are dry it will show cactus, when wet it will show water drop.
First there's humidity sensor - if we spray it, the second image will change. As it was not dried properly you can see some changes later, as water drops flows down the sensor.
Next there's hydration sensor put in the glass of water - first image will change.
Below the images are charts with sensors data grouped by hour.

Finally "warning" button is pressed, and buzzer turns on. "Warning" button is a switch, so pressing it again turns the buzzer off.
