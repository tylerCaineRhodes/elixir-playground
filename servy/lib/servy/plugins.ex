require Logger

defmodule Servy.Plugins do
  @doc "Logs 404 requests"
  def track(%{status: 404, path: path} = conv) do
    Logger.warning("Warning: #{path} not found")
    conv
  end

  def track(conv), do: conv

  def rewrite_path(%{path: "/wild" <> _endStr} = conv) do
    %{conv | path: "/wildthings"}
  end

  def rewrite_path(%{path: "/bears?id=" <> id} = conv) do
    %{conv | path: "/bears/#{id}"}
  end

  def rewrite_path(%{path: path} = conv) do
    regex = ~r{\/?<thing>(\w+)\?id=(?<id>\d+) }
    captures = Regex.named_captures(regex, path)
    rewrite_path_captures(conv, captures)
  end

  def rewrite_path(conv), do: conv

  def rewrite_path_captures(conv, %{"thing" => thing, "id" => id}) do
    %{conv | path: "/#{thing}/#{id}"}
  end

  def rewrite_path_captures(conv, nil), do: conv

  def log(conv), do: IO.inspect(conv)
end
