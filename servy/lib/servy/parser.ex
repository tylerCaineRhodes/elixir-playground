require Logger

defmodule Servy.Parser do
  alias Servy.Conv

  def parse(request) do
    [top, params_string] = String.split(request, "\r\n\r\n")
    [request_line | header_lines] = String.split(top, "\r\n")
    [method, path, _] = String.split(request_line, " ")

    headers = parse_headers(header_lines)
    params = parse_params(headers["Content-Type"], params_string)

    %Conv{
      method: method,
      path: path,
      params: params,
      headers: headers
    }
  end

  @doc """
  Parses the given param string of the form `key1=value1&key2=value2` into a mpa
  with corresponding keys and values

  ## Examples
    iex> params_string = "name=Baloo&type=Brown"
    iex> Servy.Parser.parse_params("application/x-www-form-urlencoded", params_string)
    %{"name" => "Baloo", "type" => "Brown"}
    iex> Servy.Parser.parse_params("multipart/form-data", params_string)
    %{}
    iex> params_string = ~s({"name": "Breezly", "type": "Polar"})
    iex> Servy.Parser.parse_params("application/json", params_string)
    %{"name" => "Breezly", "type" => "Polar"}
  """

  def parse_params("application/x-www-form-urlencoded", params_string) do
    params_string |> String.trim() |> URI.decode_query()
  end

  def parse_params("text/html", params_string) do
    params_string |> String.trim()
  end

  def parse_params("application/json", params_string) do
    params_string |> Poison.Parser.parse!()
  end

  def parse_params(_, _), do: %{}

  def parse_headers(header_lines) do
    Enum.reduce(header_lines, %{}, fn line, acc ->
      [key, val] = String.split(line, ": ")
      Map.put(acc, key, val)
    end)
  end
end
