defmodule Questionnaire.StudentQuestionController do
	use Questionnaire.Web, :controller
	alias Questionnaire.Student
	alias Questionnaire.StudentQuestion
	require Logger

	def new(conn, _params) do
		render conn, "new.html"
	end	

	def create(conn, params) do
		student = params |> get_student_data
		responses = params |> get_test_data
		case student.student_id do
			"" ->
				conn
        |> put_flash(:info, "Boleta requerida")
        |> redirect(to: student_question_path(conn, :new))
      _ ->
      	Logger.info "pasa"
		end

		case Repo.get_by(Student, student_id: student.student_id) do
			nil ->
				changeset = Student.changeset(%Student{}, student)
				case Repo.insert(changeset) do
					{:ok, student} ->
						Enum.each(responses, fn(r) -> 
							{_, response} = r
							test = %{students_id: student.id, questions_id: response.id, student_response: response.r}
							test_changeset = StudentQuestion.changeset(%StudentQuestion{}, test)
							Repo.insert!(test_changeset)
						end)
					conn
        	|> put_flash(:info, "Listo se ha mandado el cuestionario")
        	|> redirect(to: student_question_path(conn, :new))
					{:error, changeset} ->
						conn
        		|> put_flash(:info, changeset.errors)
        		|> redirect(to: student_question_path(conn, :new))
				end
			_ ->
				conn
        |> put_flash(:info, "Sólo puedes responder la encuesta 1 vez.")
        |> redirect(to: student_question_path(conn, :new))
		end
		# comprobar si no existe el estudiante
		# si existe regresar error
		# si no existe crear un estudiante nuevo
		# 
	end

	defp get_student_data(params) do
		%{"last_name" => last_name, "name" => name, "student_id"=> student_id} = params["form"]
		%{last_name: last_name, name: name, student_id: student_id}
	end

	defp get_test_data(params) do
		%{"q1" => q1, "q2" => q2, "q3" => q3, "q4" => q4, "q5" => q5} = params
		%{
			q1: %{id: 1, r: q1},
			q2: %{id: 2, r: q2},
			q3: %{id: 3, r: q3},
			q4: %{id: 4, r: q4},
			q5: %{id: 5, r: q5},
		}
	end
end