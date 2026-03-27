defmodule MicroRpg.GameTest do
  use ExUnit.Case
  alias MicroRpg.{Game, Player}

  setup do
    on_exit(fn -> Game.stop() end)
    :ok
  end

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Knight", :wild_strike, :precise_cut, :dark_mending)
      computer = Player.build("Malachar", :shadow_lash, :void_bolt, :dark_mend)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Knight", :wild_strike, :precise_cut, :dark_mending)
      computer = Player.build("Malachar", :shadow_lash, :void_bolt, :dark_mend)

      Game.start(computer, player)

      info = Game.info()
      assert info.player == player
      assert info.computer == computer
      assert info.status == :started
      assert info.turn == :player
    end
  end

  describe "update/1" do
    test "updates game state and toggles turn" do
      player = Player.build("Knight", :wild_strike, :precise_cut, :dark_mending)
      computer = Player.build("Malachar", :shadow_lash, :void_bolt, :dark_mend)

      Game.start(computer, player)

      new_state = %{
        computer: %{computer | life: 85},
        player: %{player | life: 50},
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      updated = Game.info()
      assert updated.computer.life == 85
      assert updated.player.life == 50
      assert updated.status == :continue
      assert updated.turn == :computer
    end

    test "sets game_over when a player reaches 0 life" do
      player = Player.build("Knight", :wild_strike, :precise_cut, :dark_mending)
      computer = Player.build("Malachar", :shadow_lash, :void_bolt, :dark_mend)

      Game.start(computer, player)

      new_state = %{
        computer: %{computer | life: 0},
        player: player,
        status: :continue,
        turn: :player
      }

      Game.update(new_state)

      assert Game.info().status == :game_over
    end
  end
end
