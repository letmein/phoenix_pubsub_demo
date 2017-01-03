defmodule Demo.Router do
  use Demo.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Demo do
    pipe_through :api
  end
end
