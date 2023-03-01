defmodule WasabiEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :wasabi_ex,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      description: description(),
      package: package(),
      deps: deps(),
      name: "wasabi_ex",
      source_url: "https://github.com/scripbox/wasabi_ex"
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
      {:httpoison, "~> 1.1"},
      {:uuid, "~> 1.1"},
      {:jason, "~> 1.0"},
      {:ex_doc, "~> 0.11", only: :dev},
      {:mock, "~> 0.3.0", only: :test},
      {:excoveralls, "~> 0.8", only: :test}
    ]
  end

  def description() do
    "Wasabi elixir SDK to interact with Intuit's Wasabi."
  end

  defp package() do
    [
      maintainers: ["Shubham Gupta"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/goodhamgupta/wasabi_ex"}
    ]
  end
end
