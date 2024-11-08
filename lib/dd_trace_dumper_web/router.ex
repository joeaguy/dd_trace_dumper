defmodule DdTraceDumperWeb.Router do
  use DdTraceDumperWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DdTraceDumperWeb do
    pipe_through :api
  end
end
