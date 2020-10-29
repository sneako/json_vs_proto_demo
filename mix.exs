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
      {:exprotobuf, "~> 1.2"},
      {:protox, "~> 1.1"},
      {:jason, "~> 1.2"},
      {:poison, "~> 3.1"},
      {:eflatbuffers, "~> 0.1.0"},
      {:msgpax, "~> 2.2"},
      {:benchee, "~> 0.12.1"}
    ]
  end
end
