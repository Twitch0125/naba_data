defmodule Backend.Players.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :first_name, :string
    field :last_name, :string
    belongs_to :team, Backend.Teams.Team

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:first_name, :last_name, :team_id])
    |> validate_required([:first_name, :last_name, :team_id])
  end
end
