defmodule Servy.Wildthings do
  alias Servy.Bear

  def list_bears do
    [
      %Bear{id: 1, name: "Teddy", type: "Brown", hibernating: true},
      %Bear{id: 2, name: "Smokey", type: "Black"},
      %Bear{id: 3, name: "Paddington", type: "Brown"},
      %Bear{id: 4, name: "Scarface", type: "Grizzly", hibernating: true},
      %Bear{id: 5, name: "Snow", type: "Polar"},
      %Bear{id: 6, name: "Brutus", type: "Grizzly"},
      %Bear{id: 7, name: "Rosie", type: "Black", hibernating: true},
      %Bear{id: 8, name: "Roscoe", type: "Panda"},
      %Bear{id: 9, name: "Iceman", type: "Polar", hibernating: true},
      %Bear{id: 10, name: "Kenai", type: "Grizzly"},
      %Bear{id: 11, name: "Yogi", type: "Brown", hibernating: false},
      %Bear{id: 12, name: "Fozzie", type: "Brown", hibernating: false},
      %Bear{id: 13, name: "Baloo", type: "Sloth", hibernating: false},
      %Bear{id: 14, name: "Gummy", type: "Cartoon", hibernating: true}
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
