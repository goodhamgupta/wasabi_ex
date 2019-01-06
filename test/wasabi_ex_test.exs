defmodule WasabiExTest do
  use ExUnit.Case
  doctest WasabiEx

  test "greets the world" do
    assert WasabiEx.hello() == :world
  end
end
