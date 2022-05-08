defmodule BlogWeb.Router do
  use BlogWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug.GraphiQL,
      schema: BlogWeb.Schema,
      interface: :playground,
      context: %{pubsub: BlogWeb.Endpoint}
  end
end
