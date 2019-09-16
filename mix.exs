defmodule ConfexVault.MixProject do
  use Mix.Project

  def project do
    [
      app: :confex_vault,
      version: "0.1.0",
      elixir: "~> 1.9",
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
      {:confex, github: "Nebo15/confex", branch: "master", override: true},
      {:distillery, "~> 2.0"},
      {:module_config, "~> 1.0"},
      {:vaultex, "~> 0.12"}
    ]
  end
end
