import Config

config :backend, Backend.Repo,
  database: "ratings_dev",
  username: "postgres",
  password: "password",
  hostname: "localhost",
  port: 5432,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
