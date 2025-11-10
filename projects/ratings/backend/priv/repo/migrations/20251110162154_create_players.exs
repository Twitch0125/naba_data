defmodule Backend.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :team_id, references(:teams, on_delete: :nothing)

      timestamps()
    end
  end
end
