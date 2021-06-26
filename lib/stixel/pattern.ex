defmodule Stixel.Pattern do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "patterns" do
    field :name, :string
    field :pixels, {:array, :string}
    field :size, :integer

    timestamps()
  end

  @doc false
  def changeset(pattern, attrs) do
    pattern
    |> cast(attrs, [:name, :pixels, :size])
    |> validate_required([:name, :pixels, :size])
    |> validate_hex(:pixels)
    |> validate_number(:size, greater_than: 0, message: "Must be greater than 0.")
  end

  @doc """
  Validates a change has the given format.

  The format has to be expressed as a regular expression.

  ## Options

    * `:message` - the message on failure, defaults to "has invalid format"

  ## Examples

  validate_format(changeset, :email, ~r/@/)

  """
  @spec validate_hex(Changeset.t(), atom, Keyword.t()) :: Changeset.t()
  defp validate_hex(changeset, field, opts \\ []) do
    validate_change(changeset, field, fn _, pixels ->
      if Enum.all?(pixels, &(&1 =~ ~r/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/)),
        do: [],
        else: [{field, {message(opts, "Not a valid hex format.")}}]
    end)
  end

  defp message(opts, key \\ :message, default) do
    Keyword.get(opts, key, default)
  end
end
