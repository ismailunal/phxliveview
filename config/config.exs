# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phxliveview,
  ecto_repos: [Phxliveview.Repo]

# Configures the endpoint
config :phxliveview, PhxliveviewWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iPEYC1dzlVBY2Nn99NseaSQ7qqeWjH5DwJM+5CE6XuIPdWhYV+7o92sZDEaWwrPo",
  render_errors: [view: PhxliveviewWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Phxliveview.PubSub,
  live_view: [signing_salt: "JvCrx/JZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
