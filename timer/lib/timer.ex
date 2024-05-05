defmodule Timer do
  def remind(reminder, seconds) do
    spawn(fn ->
      :timer.sleep(seconds * 1000)
      IO.puts("Reminder: #{reminder}")
    end)
  end
end

Timer.remind(~c"Stand Up", 5)
Timer.remind(~c"Go to bed", 10)
Timer.remind(~c"Go to work", 15)

# elixir --no-halt timer.ex
