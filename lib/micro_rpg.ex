defmodule MicroRpg do
  alias MicroRpg.{Game, Player}
  alias MicroRpg.Game.Status

  @nome_adversario "TANJIRO"

  def create_player(name, move_rnd,move_avg, move_heal) do
    Player.build(name, move_rnd,move_avg, move_heal)
  end

  def start_game(player) do
    @nome_adversario |> create_player(:soco, :chute, :curar) |> Game.start(player)
    
    Status.print_round()
  
  end

end
 