defmodule Backend.Plugs.Auth do
  @behaviour Absinthe.Middleware

  def call(resolution, _config) do
    case resolution.context do
      %{current_user: _} ->
        resolution
      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, "Unauthorized"})
    end
  end
end
