defmodule Backend.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def up do
    execute("""
    CREATE TYPE rating_type AS ENUM ('batting', 'pitching');
    """)

    create table(:ratings) do
      add :type, :rating_type, null: false
      add :contact, :integer
      add :gap, :integer
      add :power, :integer
      add :eye, :integer
      add :strikeouts, :integer
      add :stuff, :integer
      add :movement, :integer
      add :control, :integer
      add :player_id, references(:players, on_delete: :nothing)

      timestamps()
    end
  end

  def down do
    drop table(:ratings)
    execute("DROP TYPE rating_type;")
  end
end
