defmodule ConfexVault.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :confex_vault,
      version: @version,
      elixir: "~> 1.9",
      package: package(),
      description: description(),
      deps: deps(),
      docs: docs(),
      start_permanent: Mix.env() == :prod
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

  defp package do
    [
      maintainers: ["Bernard Duggan"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/hippware/confex_vault"}
    ]
  end

  defp description do
    """
    A set of modules to allow Vault secrets to be retrieved as part of a
    Confex-based configuration system
    """
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "readme",
      extras: ["README.md"]
    ]
  end
end
