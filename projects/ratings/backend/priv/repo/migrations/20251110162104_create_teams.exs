defmodule Backend.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string, null: false
      add :abbr, :string, null: false
      add :nickname, :string, null: false

      timestamps()
    end
  end
end
