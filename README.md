# WasabiEx

The Wasabi Elixir SDK enables access to Wasabi's API services.
For more information, visit the
[Wasabi repository](https://github.com/intuit/wasabi).

## Installation

* Add `wasabi_ex` to your list of dependencies in `mix.exs`:

```ex
defmodule YourApplication.Mixfile do
  use Mix.Project

  # Run "mix help deps" to learn about dependencies.
  def deps do
	  [
	    {:wasabi_ex, "~> 0.1.0"}
	  ]
  end

```

Next, run `mix deps.get` to pull down the dependencies:

```sh
$ mix deps.get
```

Now you can make an API call by obtaining an access token and using the
generated modules.


## Disclaimer

This package is not an officially supported  or endorsed by Intuit.
