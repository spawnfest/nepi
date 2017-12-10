# Sensors

Simple NERVES solution which holds implementations for following sensors:

* hydration of flowers
* precipitation
* people presence at plantation

## In order to use sensors at home

### Configuration

* set up base endpoint url in base_url which can be found config.exs
* each sensor sends data do particular endpoint. For example hydration sends data
  to /hydrations.

### Run steps

* `export MIX_TARGET=my_target` or prefix every command with
  `MIX_TARGET=my_target`. For example, `MIX_TARGET=rpi3`
* Install dependencies with `mix deps.get`
* Create firmware with `mix firmware`
* Burn to an SD card with `mix firmware.burn`
