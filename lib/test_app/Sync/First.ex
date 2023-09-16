defmodule TestApp.Sync.First do
def hello do
  receive do
    {pid, name} -> send(pid, {:ok, "Hello, #{name}!"})
  end
end
end
