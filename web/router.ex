defmodule Questionnaire.Router do
  use Questionnaire.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Questionnaire do
    pipe_through :browser # Use the default browser stack

    get "/", StudentController, :new
    post "/", StudentController, :create
    get "/students", StudentController, :index
    get "/studets/:id", StudentController, :show
    get "/students/:id/edit", StudentController, :edit
    put "/students/:id/edit", StudentController, :update
    delete "/students/:id", StudentController, :delete

    resources "/questions", QuestionController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Questionnaire do
  #   pipe_through :api
  # end
end
