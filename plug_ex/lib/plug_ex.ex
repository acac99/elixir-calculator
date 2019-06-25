defmodule PlugEx do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, PlugEx.Router, [], port: 8000)
    ]

    Logger.info("Application has began")

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
