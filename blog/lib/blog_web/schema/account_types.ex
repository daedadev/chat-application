defmodule BlogWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :username, :string
    field :email, :string
    field :password, :string
  end
end
