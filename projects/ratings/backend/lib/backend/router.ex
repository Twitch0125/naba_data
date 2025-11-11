defmodule Backend.Router do
  use Plug.Router

  plug Plug.Parsers,
    parsers: [:json],
    pass: ["*/*"],
    json_decoder: Jason
  plug :match
  plug :dispatch

  forward "/graphql", to: Backend.Pipeline
end
