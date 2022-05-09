defmodule BlogWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  enum :contact_type do
    value :phone, as: "phone"
    value :email, as: "email"
  end

  object :user do
    field :id, :id
    field :username, :string
    field :email, :string
    field :password, :string
  end
end
