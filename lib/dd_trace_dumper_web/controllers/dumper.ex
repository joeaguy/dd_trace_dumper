defmodule DdTraceDumperWeb.Dumper do
  use DdTraceDumperWeb, :controller

  def create(conn, payload) do
    IO.inspect(conn)
    IO.inspect(payload)
    conn |> put_status(200) |> json(%{})
  end
end
