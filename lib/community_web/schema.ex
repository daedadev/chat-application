defmodule CommunityWeb.Schema do
  use Absinthe.Schema

  alias CommunityWeb.NewsResolver

  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end

  object :article do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :body, non_null(:string)
  end

  query do
    @desc "Get all Links"
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve(&NewsResolver.all_links/3)
    end

    @desc "Get all Articles"
    field :all_articles, non_null(list_of(non_null(:article))) do
      resolve(&NewsResolver.all_articles/3)
    end
  end

  mutation do
    @desc "Create a new link"
    field :create_link, :link do
      arg :url, non_null(:string)
      arg :description, non_null(:string)

      resolve(&NewsResolver.create_link/3)
    end

    @desc "Create a new article"
    field :create_article, :article do
      arg :title, non_null(:string)
      arg :body, non_null(:string)

      resolve(&NewsResolver.create_article/3)
    end
  end
end
