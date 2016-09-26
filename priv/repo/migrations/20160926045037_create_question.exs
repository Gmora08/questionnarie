defmodule Questionnaire.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question_map, :map

      timestamps()
    end

  end
end
