defmodule Questionnaire.Question do
  use Questionnaire.Web, :model

  schema "questions" do
    field :question_map, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:question_map])
    |> validate_required([:question_map])
  end
end
