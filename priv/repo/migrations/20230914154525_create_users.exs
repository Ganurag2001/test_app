defmodule TestApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :meta, :string

      timestamps()
    end
  end
end
