defmodule MicroRpg.Lore do
  @enemy_name "Malachar"

  def enemy_name, do: @enemy_name

  def intro do
    """
    #{IO.ANSI.bright()}#{IO.ANSI.cyan()}
    ╔═══════════════════════════════════════════════════════════╗
    ║                                                           ║
    ║              ⚔  THE HOLLOW THRONE  ⚔                     ║
    ║                                                           ║
    ╚═══════════════════════════════════════════════════════════╝
    #{IO.ANSI.reset()}#{IO.ANSI.italic()}
      The Kingdom of Ashveil has fallen into darkness.
      King Malachar, once a just ruler, made a pact with
      the Void — trading his soul for immortality. Now he
      sits upon the Hollow Throne, a wraith of shadow and
      bone, draining the life from the land itself.

      You are the last of the Ashen Knights — warriors who
      swore an oath to protect Ashveil, even from its own king.
      Armed with a cursed blade and the will to fight, you
      descend into the Throne Hall for the final confrontation.

      There is no retreat. Only one will leave alive.
    #{IO.ANSI.reset()}
    """
  end

  def victory do
    """
    #{IO.ANSI.bright()}#{IO.ANSI.green()}
    ╔═══════════════════════════════════════════════════════════╗
    ║                    ★  VICTORY  ★                          ║
    ╠═══════════════════════════════════════════════════════════╣
    ║                                                           ║
    ║   Malachar's form shatters like glass. The shadows        ║
    ║   retreat. Light pours through the cracked ceiling         ║
    ║   of the Throne Hall for the first time in centuries.      ║
    ║                                                           ║
    ║   The curse is broken. Ashveil will heal.                  ║
    ║   Your name will be remembered for eternity.               ║
    ║                                                           ║
    ╚═══════════════════════════════════════════════════════════╝
    #{IO.ANSI.reset()}
    """
  end

  def defeat do
    """
    #{IO.ANSI.bright()}#{IO.ANSI.red()}
    ╔═══════════════════════════════════════════════════════════╗
    ║                   ☠  DEFEAT  ☠                            ║
    ╠═══════════════════════════════════════════════════════════╣
    ║                                                           ║
    ║   You fall to your knees. Malachar's cold laughter        ║
    ║   echoes through the hall as darkness swallows you.        ║
    ║                                                           ║
    ║   The Hollow Throne claims another soul.                   ║
    ║   Ashveil's last hope... extinguished.                     ║
    ║                                                           ║
    ╚═══════════════════════════════════════════════════════════╝
    #{IO.ANSI.reset()}
    """
  end

  def attack_flavor(:player, :move_rnd) do
    Enum.random([
      "You unleash a wild, reckless slash!",
      "Your blade cuts an unpredictable arc through the air!",
      "You strike with desperate fury!"
    ])
  end

  def attack_flavor(:player, :move_avg) do
    Enum.random([
      "You deliver a precise, calculated strike.",
      "Your blade finds the gap in Malachar's shadow-armor.",
      "A clean, disciplined cut lands true."
    ])
  end

  def attack_flavor(:computer, :move_rnd) do
    Enum.random([
      "Malachar's shadow tendrils lash out wildly!",
      "A burst of dark energy erupts from the wraith!",
      "Malachar strikes with chaotic fury!"
    ])
  end

  def attack_flavor(:computer, :move_avg) do
    Enum.random([
      "Malachar's spectral claw rakes across your armor.",
      "A bolt of void energy strikes you squarely.",
      "The wraith's cold blade bites deep."
    ])
  end

  def heal_flavor(:player) do
    Enum.random([
      "You channel the last embers of the Ashen Knight's power...",
      "Ancient runes on your armor glow with healing light...",
      "You draw strength from the memory of fallen comrades..."
    ])
  end

  def heal_flavor(:computer) do
    Enum.random([
      "Malachar draws power from the Hollow Throne...",
      "Dark energy coils around the wraith, mending his form...",
      "The shadows gather, restoring Malachar's strength..."
    ])
  end
end
