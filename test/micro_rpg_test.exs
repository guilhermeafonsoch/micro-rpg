defmodule MicroRpgTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias MicroRpg.{Player, Game}

  setup do
    on_exit(fn -> Game.stop() end)
    :ok
  end

  describe "create_player/4" do
    test "returns a player struct" do
      player = MicroRpg.create_player("Knight", :wild_strike, :precise_cut, :dark_mending)

      assert %Player{
               life: 100,
               name: "Knight",
               moves: %{move_rnd: :wild_strike, move_avg: :precise_cut, move_heal: :dark_mending}
             } == player
    end
  end

  describe "start_game/1" do
    test "starts the game and prints intro" do
      player = Player.build("Knight", :wild_strike, :precise_cut, :dark_mending)

      messages =
        capture_io(fn ->
          assert MicroRpg.start_game(player) == :ok
        end)

      assert messages =~ "THE HOLLOW THRONE"
      assert messages =~ "KNIGHT"
      assert messages =~ "MALACHAR"
    end
  end

  describe "make_move/1" do
    setup do
      player = Player.build("Knight", :wild_strike, :precise_cut, :dark_mending)

      capture_io(fn ->
        MicroRpg.start_game(player)
      end)

      :ok
    end

    test "when the move is valid, executes player and computer moves" do
      messages =
        capture_io(fn ->
          MicroRpg.make_move(:wild_strike)
        end)

      assert messages =~ "damage"
    end

    test "when the move is invalid, returns an error message" do
      messages =
        capture_io(fn ->
          MicroRpg.make_move(:wrong)
        end)

      assert messages =~ "Invalid move"
    end
  end
end
