defmodule Servy.BearController do
  alias Servy.Wildthings
  alias Servy.Bear

  defp bear_item(bear) do
    "<li>#{bear.name} - #{bear.type}</li>"
  end

  def index(conv) do
    items =
      Wildthings.list_bears()
      |> Enum.filter(fn b -> Bear.is_grizzly?(b) end)
      |> Enum.sort(fn a, b -> Bear.order_asc_by_name(a, b) end)
      |> Enum.map(fn b -> "<li>#{bear_item(b)}</li>" end)
      |> Enum.join()

    %{conv | status: 200, resp_body: "<ul><li>#{items}</li></ul>"}
  end

  def show(conv, %{"id" => id}) do
    bear = Wildthings.get_bear(id)
    %{conv | status: 200, resp_body: "<h1>Bear #{bear.id}: #{bear.name}</h1>"}
  end

  def create(conv, %{"name" => name, "type" => type}) do
    %{
      conv
      | status: 201,
        resp_body: "Created a #{type} bear named #{name}"
    }
  end
end
