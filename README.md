# ConfexVault

A small set of helper modules for loading Hashicorp Vault secrets into
Confex-style configurations.

## Installation

The package can be installed by adding `confex_vault` to your list
of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:confex_vault, "~> 0.1.0"}
  ]
end
```

## Use

Add the following to your `rel/config.exs` file in the `environment :prod do`
block:

```elixir
  set config_providers: [
    {ConfexVault.ConfexProvider, []}
  ]
```

Add the vault address to your app's `vaultex` config:

```elixir
config :vaultex,
  vault_addr: "https://my-vault-server.my-company.com"
```

(for other vaultex config, see [the Vaultex docs](https://github.com/findmypast/vaultex))

Set up the Vault prefix for your app. For example, if your secrets are under the
`secret/my-app` path:

```elixir
config :my_app, ConfexVault.VaultAdapter,
  vault_prefix: "secret/my-app"
```

You can now store your database password in, say, `secret/my-app/db-password`
with a key of `value` (this is currently hardcoded) and reference it in your
config like this:

```elixir
  db_password: {{:via, ConfexVault.VaultAdapter}, "db-password"}
```
