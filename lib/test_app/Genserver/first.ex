defmodule TestApp.Genserver.First do
  # use GenServer
  # Server (callbacks)

  def start_link(opts \\ nil) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, "Ram")
  end

  @impl true
  def init(initial_state) do
    {:ok, initial_state}
  end

  @impl true
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:set_state, new_state}, _state) do
    new_state = new_state + 10
    {:noreply, new_state}
  end

  @impl true
  def handle_info(:work, state) do
    {:ok, pid} = GenServer.start_link(__MODULE__, [])

    GenServer.cast(pid, {:set_state, 0})

    GenServer.call(pid, :get_state)

    {:noreply, state}
  end
end
