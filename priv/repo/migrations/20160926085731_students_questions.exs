defmodule Questionnaire.Repo.Migrations.StudentsQuestions do
  use Ecto.Migration

  def change do
		create table(:students_questions) do
  		add :students_id, references(:students)
  		add :questions_id	, references(:questions)
  		add :student_response, :string
  		timestamps
		end
  end
end
