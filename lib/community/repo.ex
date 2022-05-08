defmodule Blog.Repo do
  use Ecto.Repo,
    otp_app: :Blog,
    adapter: Ecto.Adapters.Postgres
end
