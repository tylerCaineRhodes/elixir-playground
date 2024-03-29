defmodule Servy.BearController do
  alias Servy.Wildthings
  alias Servy.Bear
  # alias Servy.BearView

  import Servy.View, only: [render: 3]

  def index(conv) do
    bears =
      Wildthings.list_bears()
      |> Enum.sort(&Bear.order_asc_by_name/2)

    render(conv, "index.eex", bears: bears)
  end

  def show(conv, %{"id" => id}) do
    bear = Wildthings.get_bear(id)

    render(conv, "show.eex", bear: bear)
  end

  def create(conv, %{"name" => name, "type" => type}) do
    %{
      conv
      | status: 201,
        resp_body: "Created a #{type} bear named #{name}!"
    }
  end

  @spec delete(%{:resp_body => any(), :status => any(), optional(any()) => any()}, any()) :: %{
          :resp_body => <<_::232>>,
          :status => 403,
          optional(any()) => any()
        }
  def delete(conv, _params) do
    %{conv | status: 403, resp_body: "Deleting a bear is forbidden!"}
  end
end
