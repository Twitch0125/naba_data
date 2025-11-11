defmodule Backend.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    field :abbr, :string
    field :nickname, :string

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :abbr, :nickname])
    |> validate_required([:name, :abbr, :nickname])
  end
end
