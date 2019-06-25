defmodule PlugEx.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)
  plug(Plug.Static, at: "/home", from: :http_server)

  get "/" do
    send_resp(conn, 200, "Hello There!")
  end

  get "/home" do
    conn = put_resp_content_type(conn, "type/html")
    send_file(conn, 200, "lib/index.html")
  end

  match(_, do: send_resp(conn, 404, "404 error not found!"))
end
