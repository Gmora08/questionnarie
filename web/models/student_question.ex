defmodule Questionnaire.StudentQuestion do
	use Questionnaire.Web, :model

	schema "studens_questions" do
		field :student_response, :string
		belongs_to :students, Questionnaire.Student
		belongs_to :questions, Questionnaire.Question

		timestamps
	end

	@doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:student_response, :students_id, :questions_id])
    |> validate_required([:student_response, :students_id, :questions_id])
  end
end