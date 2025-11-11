import Config

config :backend,
  ecto_repos: [Backend.Repo]

config :backend, Backend.Guardian,
  issuer: "backend",
  secret_key: System.get_env("GUARDIAN_SECRET_KEY")

config :guardian, Guardian.DB,
  repo: Backend.Repo,
  schema_name: "guardian_tokens"

import_config "#{config_env()}.exs"
