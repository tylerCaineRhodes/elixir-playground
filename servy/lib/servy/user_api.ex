defmodule UserApi do
  def query(id) do
    HTTPoison.get("https://jsonplaceholder.typicode.com/users/#{id}")
    |> handle_response
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    city = body
      |> Poison.decode!
      |> get_in(["address", "city"])

    {:ok, city}
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: _status, body: body}}) do
    message = body
      |> Poison.Parser.parse!(%{})
      |> Map.get("message")

    {:error, message}
  end

  def handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, reason}
  end
end

# Usage:

# case UserApi.query(1) do
#   {:ok, city} ->
#     IO.puts("City: #{city}")

#   {:error, message} ->
#     IO.puts("Error: #{message}")
# end
