# task = Task.async(fn -> :timer.sleep(7000); "Done!" end)

# Task.await(task) # Timeout after 5000ms


# task = Task.async(fn -> :timer.sleep(7000); "Done!" end)
# Task.await(task, 8000) # Timeout after 8000ms, so it will return the result


# task = Task.async(fn -> :timer.sleep(20000); "Done!" end)
# Task.await(task, :infinity) # Wait indefinitely for the result


# #  Yielding waits the specified time before returning nil, or the result if the
# #  task finishes before the timeout.

# task = Task.async(fn -> :timer.sleep(7000); "Done!" end)

# Task.yield(task, 5000) # Returns nil after 5000ms because the
# # => nil

# Task.yield(task, 8000) # Returns the result after 8000ms because the task finishes in time
# # => { :ok, "Done!" }


# case Task.yield(task, 5000) do
#   {:ok, result} ->
#     result
#   nil ->
#     Logger.warning "Timed out!"
#     Task.shutdown(task) # returns result if exists or nil
# end


# iex> :timer.seconds(5)
# 5000

# iex> :timer.minutes(5)
# 300000

# iex> :timer.hours(5)
# 18000000

# iex> Task.await(task, :timer.seconds(7))
