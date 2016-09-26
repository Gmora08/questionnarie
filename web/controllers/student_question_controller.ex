defmodule Questionnaire.StudentQuestionController do
	use Questionnaire.Web, :controller

	def new(conn, _params) do
		render conn, "new.html"
	end	

	def create(conn, params) do
		
	end
end