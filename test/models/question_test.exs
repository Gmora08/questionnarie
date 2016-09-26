defmodule Questionnaire.QuestionTest do
  use Questionnaire.ModelCase

  alias Questionnaire.Question

  @valid_attrs %{question_map: %{}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Question.changeset(%Question{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Question.changeset(%Question{}, @invalid_attrs)
    refute changeset.valid?
  end
end
