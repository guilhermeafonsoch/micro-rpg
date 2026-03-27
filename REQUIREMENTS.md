# Requirements & Installation Guide

## Prerequisites

### 1. Erlang/OTP (required by Elixir)

Elixir runs on the Erlang VM (BEAM). You need Erlang/OTP 22+ installed first.

#### Windows

**Option A — Using the official installer (recommended):**
1. Go to https://www.erlang.org/downloads
2. Download the latest **Windows 64-bit** installer (e.g., `otp_win64_26.x.x.exe`)
3. Run the installer, accept defaults
4. Add Erlang to PATH if not done automatically:
   - Open **System Properties** → **Environment Variables**
   - Add `C:\Program Files\Erlang OTP\bin` to your **Path** variable

**Option B — Using Chocolatey:**
```powershell
choco install erlang
```

**Option C — Using Scoop:**
```powershell
scoop install erlang
```

#### macOS
```bash
brew install erlang
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get install erlang
```

### 2. Elixir (1.10 or later)

#### Windows

**Option A — Official installer (recommended):**
1. Go to https://elixir-lang.org/install.html#windows
2. Download the **Windows installer** (.exe)
3. Run the installer — it will detect your Erlang installation
4. Verify: open a **new** terminal and run:
   ```powershell
   elixir --version
   ```
   You should see something like `Elixir 1.16.x (compiled with Erlang/OTP 26)`

**Option B — Using Chocolatey:**
```powershell
choco install elixir
```

**Option C — Using Scoop:**
```powershell
scoop install elixir
```

#### macOS
```bash
brew install elixir
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get install elixir
```

### 3. Mix (included with Elixir)

Mix is Elixir's build tool. It comes bundled with every Elixir installation — no separate install needed.

Verify it works:
```bash
mix --version
```

### 4. Git

Required to clone the repository. Download from https://git-scm.com/downloads if not already installed.

---

## Project Setup

Once Erlang and Elixir are installed, set up the project:

```bash
# 1. Clone the repository
git clone https://github.com/your-username/micro-rpg.git
cd micro-rpg

# 2. Install project dependencies
mix deps.get

# 3. Compile the project
mix compile
```

---

## Running the Game

```bash
mix play
```

This launches the interactive CLI game "The Hollow Throne".

---

## Development Tools

### Run Tests
```bash
mix test
```

### Code Analysis (Credo)
```bash
mix credo
```

### Auto-format Code
```bash
mix format
```

---

## Dependency Summary

| Dependency | Version | Purpose |
|------------|---------|---------|
| Erlang/OTP | 22+ | Runtime VM (BEAM) |
| Elixir | 1.10+ | Programming language |
| Mix | (bundled) | Build tool & dependency manager |
| Credo | ~> 1.5 | Static code analysis (dev/test only) |

## Troubleshooting

### `mix: command not found`
- Ensure Elixir's bin directory is in your system PATH
- On Windows, restart your terminal after installing Elixir
- Default path: `C:\Program Files (x86)\Elixir\bin`

### `erl: command not found`
- Ensure Erlang's bin directory is in your system PATH
- Default path: `C:\Program Files\Erlang OTP\bin`

### Dependencies fail to compile
```bash
mix local.hex --force
mix deps.get
```

### Tests fail with `already started` errors
The game uses a named Agent process. Tests include `on_exit` cleanup, but if you're running manually in IEx, call `MicroRpg.Game.stop()` between game sessions.
