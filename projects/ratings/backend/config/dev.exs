import Config

config :backend, Backend.Guardian,
  secret_key: "g7On6iRY1xLzzq/wH6AaKAWnvVeDk06CcAw7zmaMMTZ4G/J6riyF8ynYirBJYVCzh7E4DGhIM0yS0oNAqmHM+Q=="

config :backend, Backend.Repo,
  database: "ratings_dev",
  username: "postgres",
  password: "password",
  hostname: "localhost",
  port: 5432,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
