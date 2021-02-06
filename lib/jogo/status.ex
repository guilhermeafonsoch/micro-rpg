defmodule MicroRpg.Game.Status do
    alias MicroRpg.Game

    def print_round()do
        IO.puts("\n ====== O JOGO COMECOU CUIDADO COM SEU OPONENTE ======")
        IO.inspect(Game.info())
        IO.puts("-------------------------------------")
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


end