defmodule DdTraceDumper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DdTraceDumperWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:dd_trace_dumper, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: DdTraceDumper.PubSub},
      # Start a worker by calling: DdTraceDumper.Worker.start_link(arg)
      # {DdTraceDumper.Worker, arg},
      # Start to serve requests, typically the last entry
      DdTraceDumperWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DdTraceDumper.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DdTraceDumperWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
