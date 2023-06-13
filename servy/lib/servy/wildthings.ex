defmodule Servy.Wildthings do
  alias Servy.Bear

  def list_bears do
    [
      %Bear{id: 1, name: "Teddy", type: "Grizzly", hibernating: false},
      %Bear{id: 2, name: "Smokey", type: "Black", hibernating: true},
      %Bear{id: 3, name: "Paddington", type: "Brown", hibernating: false},
      %Bear{id: 4, name: "Yogi", type: "Brown", hibernating: false},
      %Bear{id: 5, name: "Fozzie", type: "Brown", hibernating: false},
      %Bear{id: 6, name: "Baloo", type: "Sloth", hibernating: false},
      %Bear{id: 7, name: "Gummy", type: "Cartoon", hibernating: true}
    ]
  end

  def get_bear(id) when is_integer(id) do
    list_bears()
    |> Enum.find(fn b -> b.id == id end)
  end

  def get_bear(id) when is_binary(id) do
    # strings are binaries in Elixir
    id |> String.to_integer() |> get_bear()
  end
end
