defmodule Backend.Pipeline do
  use Plug.Builder

  plug Guardian.Plug.VerifyHeader, scheme: "Bearer"
  plug Guardian.Plug.LoadResource, allow_blank: true
  plug Absinthe.Plug, schema: Backend.Schema
end
