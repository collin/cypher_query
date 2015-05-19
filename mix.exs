defmodule CypherQuery.Mixfile do
  use Mix.Project

  def project do
    [app: :cypher_query,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: "A dumb string-based query builder for neo4j Cypher queries",
     package: %{
       licenses: ["BSD"],
       contributors: ["Collin Miller <collintmiller@gmail.com>"],
       links: %{ "GitHub": "https://github.com/collin/cypher_query" }
      }
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    []
  end
end
