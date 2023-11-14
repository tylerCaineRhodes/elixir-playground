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

# converting the keys of a map from strings to atoms
style = %{"width" => 10, "height" => 20, "border" => "2px"}

new_style = Map.new(style, fn {key, val} -> {String.to_atom(key), val} end)
new_style = for {key, val} <- style, into: %{}, do: {String.to_atom(key), val}
