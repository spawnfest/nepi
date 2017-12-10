# SensorsHub

Simple web app to display live data from you flowers farm.

Currently we are displaying:

* hydration of flowers
* precipitation
* people presence at farm

Currently application is hosted at: [`sensors hub`](https://sensors-hub.herokuapp.com)

### In order to view your farm at home:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
