print_line = fn() -> "*" |> String.duplicate(50) |> IO.puts end

cat_lover? = fn(pet_choice) ->  pet_choice == :cat end
dog_lover? = fn(pet_choice) -> pet_choice == :dog end
prefs = [{'betty', :dog}, {'bob', :dog}, {'becky', :cat}]

for pref <- prefs, do:  pref

for {name, :dog} <- prefs, do: IO.puts name

for {name, pet_choice} <- prefs, pet_choice == :dog, do: IO.puts name

for {name, pet_choice} <- prefs, dog_lover?.(pet_choice), do: IO.puts name

for {name, :cat} <- prefs, do: IO.puts name

for {name, pet_choice} <- prefs, pet_choice == :cat, do: IO.puts name

for {name, pet_choice} <- prefs, cat_lover?.(pet_choice), do: IO.puts name

print_line.()

# normal for loops
for i <- 1..10 do
  IO.puts "Iteration: #{i}"
end

for i <- 1..10, rem(i, 2) == 0 do
  IO.puts "Even number: #{i}"
end

for i <- 1..10, rem(i, 2) == 0, do: IO.puts "Even number: #{i}"

print_line.()

# converting the keys of a map from strings to atoms
style = %{"width" => 10, "height" => 20, "border" => "2px"}

new_style = Map.new(style, fn {key, val} -> {String.to_atom(key), val} end)
new_style = for {key, val} <- style, into: %{}, do: {String.to_atom(key), val}

print_line.()

ranks =
  [ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" ]

suits =
  [ "♣", "♦", "♥", "♠" ]

deck = for rank <- ranks, suit <- suits do
  {rank, suit}
end

deck
|> length
|> IO.inspect

hand = deck
  |> Enum.take_random(13)
  |> IO.inspect

hand = Enum.shuffle
  |> Enum.take(13)
  |> IO.inspect
