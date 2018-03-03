defmodule JsonVsProtoDemoTest do
  use ExUnit.Case
  doctest JsonVsProtoDemo

  test "greets the world" do
    assert JsonVsProtoDemo.hello() == :world
  end
end
