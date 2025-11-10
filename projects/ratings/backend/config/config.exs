import Config

config :backend,
  ecto_repos: [Backend.Repo]

import_config "#{config_env()}.exs"
