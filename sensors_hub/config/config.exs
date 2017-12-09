# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sensors_hub,
  ecto_repos: [SensorsHub.Repo]

# Configures the endpoint
config :sensors_hub, SensorsHubWeb.Endpoint,
  url: [scheme: "https", host: "https://sensors-hub.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: "yMTWkZ3J4lYCEOqsvlZHEPxbIqSA6tnEAviCrQxFIGpYH5FzKIIFEh5tKdjs/dGv",
  render_errors: [view: SensorsHubWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SensorsHub.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
