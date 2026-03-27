defmodule MicroRpg.CLI do
  alias MicroRpg.Game

  def main do
    IO.puts(MicroRpg.Lore.intro())
    name = prompt("  Enter your name, wanderer: ")
    name = if String.trim(name) == "", do: "Knight", else: String.trim(name)

    IO.puts("\n  #{IO.ANSI.bright()}Welcome, #{name}. Choose your fighting style:#{IO.ANSI.reset()}")
    IO.puts("  Your moves will be mapped to these commands:\n")
    IO.puts("  #{IO.ANSI.red()}Wild Strike#{IO.ANSI.reset()}   — A reckless attack (10-35 dmg). High risk, high reward.")
    IO.puts("  #{IO.ANSI.yellow()}Precise Cut#{IO.ANSI.reset()}  — A disciplined strike (18-25 dmg). Reliable damage.")
    IO.puts("  #{IO.ANSI.green()}Dark Mending#{IO.ANSI.reset()} — Channel ancient power to heal (18-25 HP).\n")

    player = MicroRpg.create_player(name, :wild_strike, :precise_cut, :dark_mending)
    MicroRpg.start_game(player)

    game_loop()
  end

  defp game_loop do
    case Game.info().status do
      :game_over ->
        IO.puts("\n  #{IO.ANSI.bright()}Thanks for playing The Hollow Throne!#{IO.ANSI.reset()}\n")

      _ ->
        choice = prompt("  ⚔ Choose [1] Wild Strike  [2] Precise Cut  [3] Dark Mending: ")

        move =
          case String.trim(choice) do
            "1" -> :wild_strike
            "2" -> :precise_cut
            "3" -> :dark_mending
            _ -> :invalid
          end

        MicroRpg.make_move(move)
        game_loop()
    end
  end

  defp prompt(text) do
    IO.gets(text) |> to_string() |> String.trim()
  end
end
