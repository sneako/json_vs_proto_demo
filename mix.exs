defmodule JsonVsProtoDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :json_vs_proto_demo,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:protox, "~> 1.1"},
      {:protobuf, "~> 0.8"},
      {:jason, "~> 1.2"},
      {:eflatbuffers, "~> 0.1"},
      {:msgpax, "~> 2.2"},
      {:benchee, "~> 1.0"},
      {:erlavro, "~> 2.9"}
    ]
  end
end
