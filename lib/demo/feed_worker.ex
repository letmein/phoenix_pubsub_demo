defmodule Demo.FeedWorker do
  use GenServer

  def start_link(channel) do
    GenServer.start_link(__MODULE__, channel)
  end

  def init(channel) do
    ref = Demo.Endpoint.subscribe(channel)
    state = {self, channel, ref}
    {:ok, state}
  end

  def handle_info(%{event: event_name, payload: payload}, state) do
    IO.puts "Received #{event_name}"
    IO.inspect payload
    {:noreply, state}
  end
end
