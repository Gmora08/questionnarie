defmodule Questionnaire.Repo.Migrations.CreateStudent do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string
      add :last_name, :string
      add :student_id, :integer

      timestamps()
    end

  end
end
