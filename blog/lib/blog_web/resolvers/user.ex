defmodule BlogWeb.Resolvers.User do
  def create_user(_parent, args, _resolution) do
    {:ok, Blog.User.create_user()}
  end
end
