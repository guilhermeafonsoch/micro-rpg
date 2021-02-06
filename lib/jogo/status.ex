defmodule MicroRpg.Game.Status do
    alias MicroRpg.Game

    def print_round(%{status: :started} = info) do
        IO.puts("\n===== The game is started! =====\n")
        IO.inspect(info)
        IO.puts("------------------------------")
      end
    
      def print_round(%{status: :continue, turn: player} = info) do
        IO.puts("\n===== It's #{player} turn. =====\n")
        IO.inspect(info)
        IO.puts("------------------------------")
      end
    
      def print_round(%{status: :game_over} = info) do
        IO.puts("\n===== The game is over. =====\n")
        IO.inspect(info)
        IO.puts("------------------------------")
      end

    def print_wrong_move_messege(move) do
        IO.puts("\n ====== Invalid move: #{move} ======")
    end

    def print_move_message(:computer, :attack, damage) do
        IO.puts("\n ====== Voce acabou de atacar o Tanjiro com um dano de #{damage} ======")
    end

    def print_move_message(:player, :attack, damage) do
        IO.puts("\n ====== Tanjiro acabou de atacar o voce com um dano de #{damage} ======")
    end

    def print_move_message(player, :heal, life) do
      IO.puts("\n ====== O #{player} se curou para #{life}  pontos de vida.======")
  end


end