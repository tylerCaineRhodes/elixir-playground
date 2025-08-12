# {:ok, %HTTPoison.Response{status_code: status, body: body}} = HTTPoison.get "https://jsonplaceholder.typicode.com/users/1"

# body_map = body |> Poison.Parser.parse!(%{})

# body_map =  body |> Poison.decode!

# body_map |> get_in(["address", "city"])

# body_map |> Map.get("address") |> Map.get("city")

