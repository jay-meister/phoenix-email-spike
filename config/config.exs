# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :email_spike,
  ecto_repos: [EmailSpike.Repo]

# Configures the endpoint
config :email_spike, EmailSpike.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cChXxxR4i+I+SIvq1Vwia5SJnoKFE6MmitlSbEnTK9BIkl3BTpR5ytdq+W1mlmx+",
  render_errors: [view: EmailSpike.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EmailSpike.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :email_spike, EmailSpike.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: System.get_env("SES_SERVER"),
  port: System.get_env("SES_PORT"),
  username: System.get_env("SMTP_USERNAME"),
  password: System.get_env("SMTP_PASSWORD"),
  tls: :always, # can be `:always` or `:never`
  ssl: false, # can be `true`
  retries: 1

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
