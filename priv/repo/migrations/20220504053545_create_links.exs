defmodule Community.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :url, :string, null: false
      add :description, :text

      timestamps()
    end
  end
end
