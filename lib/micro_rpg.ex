defmodule MicroRpg do
  alias MicroRpg.{Game, Player}
  alias MicroRpg.Game.{Actions, Status}

  @nome_adversario "TANJIRO"
  @computer_moves [:move_avg, :move_rnd, :move_heal]

  def create_player(name, move_rnd,move_avg, move_heal) do
    Player.build(name, move_rnd,move_avg, move_heal)
  end

  def start_game(player) do
    @nome_adversario |> create_player(:soco, :chute, :curar) |> Game.start(player)

    Status.print_round(Game.info())

  end

  def make_move(move) do
    Game.info()
    |> Map.get(:status)
    |> handle_status(move)
  end

  defp handle_status(:game_over, _move), do: Status.print_round(Game.info())

  defp handle_status(_other, move) do
    move
    |> Actions.fetch_move()
    |> do_move()

    computer_move(Game.info())
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_messege(move)
  
  defp do_move({:ok, move}) do
    case move do
      :move_heal -> Actions.heal()
      move -> Actions.attack(move)
    end
    Status.print_round(Game.info())
  end

  defp computer_move(%{turn: :computer, status: :continue}) do
    move = {:ok, Enum.random(@computer_moves)}
    do_move(move)
  end

  defp computer_move(_), do: :ok

end
