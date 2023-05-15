defmodule Servy.FileHandler do
  @pages_path Path.expand("../../pages", __DIR__)

  def handle_file(%{file_name: file_name, conv: conv}) do
    @pages_path
    |> Path.join(file_name)
    |> File.read()
    |> handle_file_response(conv)
  end

  defp handle_file_response({:ok, content}, conv) do
    %{conv | status: 200, resp_body: content}
  end

  defp handle_file_response({:error, :enoent}, conv) do
    %{conv | status: 404, resp_body: "File not found!"}
  end

  defp handle_file_response({:error, reason}, conv) do
    %{conv | status: 500, resp_body: "File error #{reason}"}
  end
end
