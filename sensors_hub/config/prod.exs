use Mix.Config

config :sensors_hub, SensorsHubWeb.Endpoint,
  load_from_system_env: true,
  url: [scheme: "https", host: "sensors-hub.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE"),
  render_errors: [view: SensorsHubWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SensorsHub.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, level: :info

config :sensors_hub, SensorsHub.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true
