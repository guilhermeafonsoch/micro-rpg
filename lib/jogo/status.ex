defmodule MicroRpg.Game.Status do
    alias MicroRpg.Game

    def print_round()do
        IO.puts("\n ====== O JOGO COMECOU CUIDADO COM SEU OPONENTE ======")
        IO.inspect(Game.info())
        IO.puts("-------------------------------------")
    end


end