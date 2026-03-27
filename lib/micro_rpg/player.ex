defmodule MicroRpg.Player do
  @max_life 100

  @enforce_keys [:life, :name, :moves]
  defstruct [:life, :name, :moves]

  def build(name, move_rnd, move_avg, move_heal) do
    %__MODULE__{
      life: @max_life,
      name: name,
      moves: %{
        move_rnd: move_rnd,
        move_avg: move_avg,
        move_heal: move_heal
      }
    }
  end

  def max_life, do: @max_life
end
