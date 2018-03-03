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
      {:jiffy, "~> 0.15.0"},
      {:poison, "~> 3.1"},
      {:benchee, "~> 0.12.1"}
    ]
  end
end
