defmodule Servy.SnapshotsController do
  alias Servy.VideoCam

  import Servy.View, only: [render: 3]

  def index(conv) do
    task = Task.async(fn -> Servy.Tracker.get_location("bigfoot") end)

    snapshots =
      ["cam-1", "cam-2", "cam-3"]
      |> Enum.map(&Task.async(fn -> VideoCam.get_snapshot(&1) end))
      |> Enum.map(&Task.await/1)

    where_is_bigfoot = Task.await(task)

    render(
      conv,
      "snapshots/index.eex",
      [
        snapshots: snapshots,
        where_is_bigfoot: where_is_bigfoot
      ]
    )
  end
end
