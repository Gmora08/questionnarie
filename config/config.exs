# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :questionnaire,
  ecto_repos: [Questionnaire.Repo]

# Configures the endpoint
config :questionnaire, Questionnaire.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "c2eJ6et6te1CJN5255KUTmd02Pnfj7EM6kwRysb823dw6FdxHgEkFSHAbftEFGAG",
  render_errors: [view: Questionnaire.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Questionnaire.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
