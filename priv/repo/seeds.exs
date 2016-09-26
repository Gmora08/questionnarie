# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Questionnaire.Repo.insert!(%Questionnaire.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Questionnaire.Question
alias Questionnaire.Repo

Question.changeset(%Question{}, %{question_map: %{id: 1, r: 2} }) |> Repo.insert!
Question.changeset(%Question{}, %{question_map: %{id: 2, r: 1} }) |> Repo.insert!
Question.changeset(%Question{}, %{question_map: %{id: 3, r: 3} }) |> Repo.insert!
Question.changeset(%Question{}, %{question_map: %{id: 4, r: 1} }) |> Repo.insert!
Question.changeset(%Question{}, %{question_map: %{id: 5, r: 2} }) |> Repo.insert!
