defmodule Stixel.Repo do
  use Ecto.Repo,
    otp_app: :stixel,
    adapter: Ecto.Adapters.Postgres
end
