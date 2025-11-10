import Config

config :backend, Backend.Repo,
  database: "ratings_test",
  username: "postgres",
  password: "password",
  hostname: "localhost",
  port: 5432,
  pool_size: 10
