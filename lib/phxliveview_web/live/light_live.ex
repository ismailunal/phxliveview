defmodule PhxliveviewWeb.LightLive do
  use PhxliveviewWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :brightness, 10)}
  end


  def render(assigns) do
    ~L"""
    <h1>Light</h1>
    <div style="width:100%; border:1px solid black;padding:0; margin:0;">
      <div style="text-align:center; color:white; background-color:red; width: <%= @brightness %>%">
      <%= @brightness %>%
      </div>
    </div>

    <br/>
    <button type="button" phx-click="off">set to "0"</button>
    <button type="button" phx-click="inc">inc by 10</button>
    <button type="button" phx-click="dec">desc by 10</button>
    <button type="button" phx-click="on">set to "100"</button>

    """
  end

  def handle_event("on", _, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end

  def handle_event("inc", _, socket) do
    brightness = socket.assigns.brightness + 10
    socket = assign(socket, :brightness, brightness)
    {:noreply, socket}
  end

  def handle_event("dec", _, socket) do
    socket = update(socket, :brightness, &(&1 - 10))
    {:noreply, socket}
  end




end
