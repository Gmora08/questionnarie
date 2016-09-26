defmodule Questionnaire.Student do
  use Questionnaire.Web, :model

  schema "students" do
    field :name, :string
    field :last_name, :string
    field :student_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :last_name, :student_id])
    |> validate_required([:name, :last_name, :student_id])
  end
end
