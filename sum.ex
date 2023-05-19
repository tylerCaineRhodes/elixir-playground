defmodule Mathy do
  def add([head | tail], sum) do
    sum = sum + head
    add(tail, sum)
  end

  def add([], sum), do: sum

  def triple([head | tail], tripled) do
    # reversing the result is more performant than [trippled ++ [head]]
    triple(tail, [head * 3 | tripled])
  end

  def triple([], tripled) do
    tripled |> Enum.reverse()
  end
end

total = Mathy.add([1, 2, 3, 4, 5], 0)
IO.puts "Total sum: #{total}"

tripled = Mathy.triple([1, 2, 3, 4, 5], [])
IO.puts "Numbers tripled: #{inspect(tripled)}"
