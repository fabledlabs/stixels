defmodule Stixel.Repo.Migrations.CreatePatterns do
  use Ecto.Migration

  def change do
    create table(:patterns, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :pixels, {:array, :string}
      add :size, :integer

      timestamps()
    end

  end
end
