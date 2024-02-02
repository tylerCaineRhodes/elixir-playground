defmodule Servy.Wildthings do
  alias Servy.Bear

  def list_bears do
    Path.expand("../../db", __DIR__)
    |> Path.join("bears.json")
    |> read_json
    |> Poison.decode!(as: %{"bears" => [%Bear{}]})
    |> Map.get("bears")
  end

  defp read_json(source) do
    case File.read(source) do
      {:ok, content} -> content
      {:error, reason} -> raise "Error reading file: #{reason}"
    end
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
