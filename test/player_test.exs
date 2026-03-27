defmodule MicroRpg.PlayerTest do
  use ExUnit.Case
  alias MicroRpg.Player

  describe "build/4" do
    test "creates a player with 100 life and the given moves" do
      player = Player.build("Knight", :wild_strike, :precise_cut, :dark_mending)

      assert %Player{
               life: 100,
               name: "Knight",
               moves: %{
                 move_rnd: :wild_strike,
                 move_avg: :precise_cut,
                 move_heal: :dark_mending
               }
             } == player
    end
  end
end
