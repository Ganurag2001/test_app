defmodule TestApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  @telegram_token Application.compile_env(:test_app, :notifiex_telegram_token)
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {NotifiexTelegram, [token: @telegram_token]},
      # Start the Ecto repository
      TestApp.Repo,
      # Start the Telemetry supervisor
      TestAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TestApp.PubSub},
      # Start the Endpoint (http/https)
      TestAppWeb.Endpoint
      # Start a worker by calling: TestApp.Worker.start_link(arg)
      # {TestApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
