defmodule Backend.Ratings.Rating do
  use Ecto.Schema
  import Ecto.Changeset

  @rating_types [:batting, :pitching]

  schema "ratings" do
    field :type, Ecto.Enum, values: @rating_types

    # Batting ratings
    field :contact, :integer
    field :gap, :integer
    field :power, :integer
    field :eye, :integer
    field :strikeouts, :integer

    # Pitching ratings
    field :stuff, :integer
    field :movement, :integer
    field :control, :integer

    belongs_to :player, Backend.Players.Player

    timestamps()
  end

  @doc false
  def changeset(rating, attrs) do
    rating
    |> cast(attrs, [
      :type,
      :contact,
      :gap,
      :power,
      :eye,
      :strikeouts,
      :stuff,
      :movement,
      :control,
      :player_id
    ])
    |> validate_required([:type, :player_id])
  end
end
