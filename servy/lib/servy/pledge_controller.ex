defmodule Servy.PledgeController do
  import Servy.View

  def create(conv, %{"name" => name, "amount" => amount}) do
    Servy.PledgeServer.create_pledge(name, String.to_integer(amount))

    %{conv | status: 200, resp_body: "#{name} pledged #{amount}!"}
  end

  def new(conv) do
    render(conv, "pledges/new_pledge.eex")
  end

  def index(conv) do
    pledges = Servy.PledgeServer.recent_pledges()

    render(conv, "pledges/recent_pledges.eex", pledges: pledges)
  end
end
