defmodule TestApp.Genserver.Second do
  use GenServer
  # Server (callbacks)

  def start_link(opts \\ nil) do
    GenServer.start_link(__MODULE__, "Sham")
  end

  def init(initial_state) do
    {:ok, initial_state}
  end

  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:set_state, new_state}, state) do
    {:noreply, new_state}
  end
end
