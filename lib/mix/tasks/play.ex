defmodule Mix.Tasks.Play do
  use Mix.Task

  @shortdoc "Play The Hollow Throne — a dark fantasy micro RPG"

  @impl Mix.Task
  def run(_args) do
    MicroRpg.CLI.main()
  end
end
