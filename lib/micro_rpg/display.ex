defmodule MicroRpg.Display do
  alias MicroRpg.{Game, Player, Lore}

  @bar_length 20

  def print_round(%{status: :started} = info) do
    IO.puts(Lore.intro())
    print_status_bar(info)
    IO.puts("")
  end

  def print_round(%{status: :continue, turn: :player} = info) do
    print_status_bar(info)
    print_move_menu(info.player)
  end

  def print_round(%{status: :continue, turn: :computer} = _info), do: :ok

  def print_round(%{status: :game_over} = info) do
    print_status_bar(info)

    if info.computer.life == 0 do
      IO.puts(Lore.victory())
    else
      IO.puts(Lore.defeat())
    end
  end

  def print_move_message(target, :attack, damage, move) do
    attacker = if target == :computer, do: :player, else: :computer
    flavor = Lore.attack_flavor(attacker, move)

    target_name =
      if target == :computer, do: Lore.enemy_name(), else: Game.fetch_player(:player).name

    IO.puts("")
    IO.puts("  #{IO.ANSI.italic()}#{flavor}#{IO.ANSI.reset()}")

    IO.puts(
      "  #{IO.ANSI.red()}⚔ #{target_name} takes #{damage} damage!#{IO.ANSI.reset()}"
    )
  end

  def print_move_message(player, :heal, healed_to) do
    flavor = Lore.heal_flavor(player)

    name =
      if player == :computer, do: Lore.enemy_name(), else: Game.fetch_player(:player).name

    IO.puts("")
    IO.puts("  #{IO.ANSI.italic()}#{flavor}#{IO.ANSI.reset()}")

    IO.puts(
      "  #{IO.ANSI.green()}✚ #{name} heals to #{healed_to} HP!#{IO.ANSI.reset()}"
    )
  end

  def print_wrong_move_message(move) do
    IO.puts("\n  #{IO.ANSI.yellow()}⚠ Invalid move: #{move}#{IO.ANSI.reset()}")
  end

  defp print_status_bar(info) do
    player = info.player
    computer = info.computer

    IO.puts("")
    IO.puts("  ┌──────────────────────────────────────────┐")

    IO.puts(
      "  │ #{pad_name(player.name)} #{health_bar(player.life)} #{pad_hp(player.life)} │"
    )

    IO.puts(
      "  │ #{pad_name(computer.name)} #{health_bar(computer.life)} #{pad_hp(computer.life)} │"
    )

    IO.puts("  └──────────────────────────────────────────┘")
  end

  defp print_move_menu(player) do
    moves = player.moves
    IO.puts("")
    IO.puts("  #{IO.ANSI.bright()}Your turn, #{player.name}. Choose wisely:#{IO.ANSI.reset()}")
    IO.puts("  [1] #{IO.ANSI.red()}Wild Strike#{IO.ANSI.reset()}   (10-35 dmg)  — #{moves.move_rnd}")
    IO.puts("  [2] #{IO.ANSI.yellow()}Precise Cut#{IO.ANSI.reset()}  (18-25 dmg)  — #{moves.move_avg}")
    IO.puts("  [3] #{IO.ANSI.green()}Dark Mending#{IO.ANSI.reset()} (18-25 heal) — #{moves.move_heal}")
    IO.puts("")
  end

  defp health_bar(life) do
    max = Player.max_life()
    filled = round(life / max * @bar_length)
    empty = @bar_length - filled

    color =
      cond do
        life > 60 -> IO.ANSI.green()
        life > 30 -> IO.ANSI.yellow()
        true -> IO.ANSI.red()
      end

    "#{color}[#{String.duplicate("█", filled)}#{String.duplicate("░", empty)}]#{IO.ANSI.reset()}"
  end

  defp pad_name(name) do
    String.pad_trailing(String.upcase(name), 12)
  end

  defp pad_hp(life) do
    String.pad_leading("#{life}/100", 7)
  end
end
