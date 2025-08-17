defmodule HttpServerTest do
  use ExUnit.Case

  alias Servy.HttpServer

  test "accepts a request on a socket and sends back a response" do
    spawn(HttpServer, :start, [4000])

    {:ok, response} = HTTPoison.get "http://localhost:4000/wildthings"

    assert response.status_code == 200
    assert response.body == "Bears, Lions, Tigers"

    urls = [
      "http://localhost:4000/wildthings",
      "http://localhost:4000/bears",
      "http://localhost:4000/bears/1",
      "http://localhost:4000/wildlife",
      "http://localhost:4000/api/bears"
    ]

    urls
    |> Enum.map(&Task.async(fn -> HTTPoison.get(&1) end))
    |> Enum.map(&Task.await/1)
    |> Enum.map(&assert_successful_response/1)

  end

  defp assert_successful_response({:ok, response}) do
    assert response.status_code == 200
  end

  # test "accepts a request on a socket and sends back a response concurrently" do
  #   spawn(HttpServer, :start, [4000])

  #   parent = self()

  #   max_concurrent_requests = 5

  #   for _ <- 1..max_concurrent_requests do
  #     spawn(fn ->
  #       {:ok, response} = HTTPoison.get "http://localhost:4000/wildthings"

  #       send(parent, {:ok, response})
  #     end)
  #   end

  #   for _ <- 1..max_concurrent_requests do
  #     receive do
  #       {:ok, response} ->
  #         assert response.status_code == 200
  #         assert response.body == "Bears, Lions, Tigers"
  #     end
  #   end
  # end
end
