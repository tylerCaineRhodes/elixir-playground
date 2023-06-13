defmodule Servy.BearController do
  alias Servy.Wildthings

  def index(conv) do
    items =
      Wildthings.list_bears()
      |> Enum.filter(fn b -> !b.hibernating end)
      |> Enum.sort(fn a, b -> a.name <= b.name end)
      |> Enum.map(fn b -> "<li>#{b.name} - #{b.type}</li>" end)
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
