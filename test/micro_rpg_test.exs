defmodule MicroRpgTest do
  use ExUnit.Case
  doctest MicroRpg

  test "greets the world" do
    assert MicroRpg.hello() == :world
  end
end
