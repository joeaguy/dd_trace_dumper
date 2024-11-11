defmodule DdTraceDumperWeb.Router do
  use DdTraceDumperWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DdTraceDumperWeb do
    pipe_through :api
    match :*,  "/*path", Dumper, :create
  end
end
