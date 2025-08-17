defmodule Servy.PledgeController do
  def create(conv, %{"name" => name, "amount" => amount}) do
    Servy.PledgeServer.create_pledge(name, String.to_integer(amount))

    %{conv | status: 200, resp_boday: "#{name} pledged #{amount}!"}
  end

  def index(conv) do
    pledges = Servy.PledgeServer.recent_pledges()

    %{conv | status: 200, resp_boday: inspect(pledges)}
  end
end
