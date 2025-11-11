ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(Backend.Repo, :manual)

Code.require_file("support/data_case.ex", __DIR__)
