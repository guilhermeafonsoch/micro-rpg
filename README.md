# ⚔ The Hollow Throne — A Dark Fantasy Micro RPG

![Badge](https://img.shields.io/static/v1?label=Elixir&message=1.10%2B&color=blueviolet&style=for-the-badge)

> *The Kingdom of Ashveil has fallen. King Malachar sits upon the Hollow Throne, a wraith of shadow and bone. You are the last of the Ashen Knights. There is no retreat.*

A turn-based CLI RPG built in Elixir. Fight the wraith king Malachar in tactical combat — choose your attacks wisely, heal when needed, and survive long enough to break the curse.

## How to Play

### Prerequisites

- [Elixir](https://elixir-lang.org/install.html) 1.10 or later

### Quick Start

```bash
# Clone the repository
git clone https://github.com/your-username/micro-rpg.git
cd micro-rpg

# Install dependencies
mix deps.get

# Play!
mix play
```

### Gameplay

You'll be prompted to enter your character's name, then the battle begins. Each turn you choose one of three actions:

| # | Move | Effect | Description |
|---|------|--------|-------------|
| 1 | **Wild Strike** | 10–35 damage | A reckless, unpredictable attack. High risk, high reward. |
| 2 | **Precise Cut** | 18–25 damage | A disciplined strike. Consistent and reliable. |
| 3 | **Dark Mending** | 18–25 heal | Channel ancient power to restore your health (max 100 HP). |

After your turn, Malachar strikes back automatically. The battle continues until one combatant falls to 0 HP.

### Strategy Tips

- **Wild Strike** can deal massive damage but can also whiff — use it when you're ahead or feeling bold.
- **Precise Cut** is your bread and butter — steady damage wins wars.
- **Dark Mending** caps at 100 HP, so don't waste it when you're near full health.
- Malachar's moves are random — sometimes he heals, sometimes he hits hard. Adapt.

### Example

```
  ┌──────────────────────────────────────────┐
  │ KNIGHT       [████████░░░░░░░░░░░░]  42  │
  │ MALACHAR     [██████████████░░░░░░]  71  │
  └──────────────────────────────────────────┘

  Your turn, Knight. Choose wisely:
  [1] Wild Strike   (10-35 dmg)
  [2] Precise Cut   (18-25 dmg)
  [3] Dark Mending  (18-25 heal)

  ⚔ Choose [1] Wild Strike  [2] Precise Cut  [3] Dark Mending: 1

  Your blade cuts an unpredictable arc through the air!
  ⚔ Malachar takes 28 damage!
```

## Development

```bash
# Run tests
mix test

# Code analysis
mix credo

# Format code
mix format
```

## Project Structure

```
lib/
  micro_rpg.ex              # Game facade — orchestrates moves and turns
  micro_rpg/
    cli.ex                  # Interactive CLI game loop
    game.ex                 # Game state (Elixir Agent)
    player.ex               # Player struct
    lore.ex                 # Story text, flavor messages, ASCII art
    display.ex              # Formatted output, health bars, colors
    actions.ex              # Action dispatcher
    actions/
      attack.ex             # Attack logic and damage calculation
      heal.ex               # Healing logic
  mix/tasks/
    play.ex                 # `mix play` task entry point
```

## Interactive (IEx) Mode

You can also play from an interactive Elixir shell:

```elixir
iex -S mix

player = MicroRpg.create_player("Knight", :wild_strike, :precise_cut, :dark_mending)
MicroRpg.start_game(player)
MicroRpg.make_move(:wild_strike)
MicroRpg.make_move(:precise_cut)
MicroRpg.make_move(:dark_mending)
```

## License

MIT
