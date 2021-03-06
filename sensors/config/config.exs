# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Customize the firmware. Uncomment all or parts of the following
# to add files to the root filesystem or modify the firmware
# archive.

# config :nerves, :firmware,
#   rootfs_overlay: "rootfs_overlay",
#   fwup_conf: "config/fwup.conf"

config :sensors,
  hydration_pin: 17,
  humidity_pin: 5,
  alarm_pin: 26,
  sensor_type: :hydration,
  base_url: "https://sensors-hub.herokuapp.com/api/",
  socket_url: "wss://sensors-hub.herokuapp.com/socket/websocket"

key_mgmt = System.get_env("NERVES_NETWORK_KEY_MGMT") || "WPA-PSK"

config :nerves_network,
  regulatory_domain: "US"

config :nerves_network, :default,
  wlan0: [
    ssid: "defii",
    psk: "UPC004743",
    key_mgmt: String.to_atom(key_mgmt)
  ]

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"

# Use bootloader to start the main application. See the bootloader
# docs for separating out critical OTP applications such as those
# involved with firmware updates.
config :bootloader,
  # init: [:nerves_runtime, :nerves_network],
  init: [:nerves_runtime],
  app: Mix.Project.config[:app]
