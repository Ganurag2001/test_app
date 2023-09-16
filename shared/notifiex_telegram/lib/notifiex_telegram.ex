defmodule NotifiexTelegram do
  use Supervisor

  def start_link(opts) do
    name = opts[:name] || __MODULE__

    Supervisor.start_link(__MODULE__, [name: name] ++ opts)
  end

  @impl Supervisor
  def init(args) do
    token = Keyword.fetch!(args, :token)

    children = [
      ExGram,
      {NotifiexTelegram.Bot, [method: :polling, token: token]}
    ]

    opts = [strategy: :one_for_one]
    # , name: NotifiexTelegram.Application.Supervisor]
    Supervisor.init(children, opts)
  end
end
