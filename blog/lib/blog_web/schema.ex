defmodule BlogWeb.Schema do
  use Absinthe.Schema
  import_types BlogWeb.Schema.ContentTypes
  import_types BlogWeb.Schema.UserTypes

  alias BlogWeb.Resolvers

  query do

    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve &Resolvers.Content.list_posts/3
    end

  end

  mutation do

    @desc "Create a new user"
    field :create_user, :user do
      arg :username, non_null(:string)
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &Resolvers.User.create_user/3
    end
  end

end
