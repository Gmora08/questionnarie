defmodule Questionnaire.StudentTest do
  use Questionnaire.ModelCase

  alias Questionnaire.Student

  @valid_attrs %{last_name: "some content", name: "some content", student_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Student.changeset(%Student{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Student.changeset(%Student{}, @invalid_attrs)
    refute changeset.valid?
  end
end
