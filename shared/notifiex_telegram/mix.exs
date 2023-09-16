defmodule NotifiexTelegram.MixProject do
  use Mix.Project

  def project do
    [
      app: :notifiex_telegram,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_gram, git: "https://github.com/rockneurotiko/ex_gram"},
      # {:tesla, "~> 1.4"},
      {:tesla, git: "https://github.com/teamon/tesla", override: true},
      {:jason, "~> 1.2"}
    ]
  end
end
