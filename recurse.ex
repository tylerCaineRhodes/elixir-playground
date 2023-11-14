defmodule Recurse do
  def loopy([head | tail]) do
    IO.puts "Head: #{head} Tail: #{inspect(tail)}"
    loopy(tail)
  end

  def loopy([]), do: IO.puts "Done!"

  def triple(list) do
    triple(list, [])
  end

  defp triple([head|tail], current_list) do
    triple(tail, [head * 3 | current_list])
  end

  defp triple([], current_list) do
    current_list |>
     Enum.reverse |>
      inspect|>
       IO.puts
  end

  def sum([head | tail], acc) do
    acc = acc + head
    sum(tail, acc)
  end

  def sum([], acc), do: IO.puts(acc)


  def my_map([head | tail], func) do
    [func.(head) | my_map(tail, func)]
  end

  def my_map([], _func), do: []
end

Recurse.loopy([1, 2, 3, 4, 5])

# Recurse.my_map(nums, &(&1 * 2))
# # [2, 4, 6, 8, 10]

# Recurse.my_map(nums, &(&1 * 4))
# # [4, 8, 12, 16, 20]

#  Recurse.my_map(nums, &(&1 * 5))
# # [5, 10, 15, 20, 25]

# acc = IO.gets("what is the accumulator?: ") |>
# String.trim |>
# String.to_integer

# Recurse.sum([1, 2, 3, 4], acc)

# Recurse.triple([1, 2, 3, 4])

nums = [1, 2, 3, 4, 5]

IO.puts inspect(Recurse.my_map(nums, &(&1 * 2)))
