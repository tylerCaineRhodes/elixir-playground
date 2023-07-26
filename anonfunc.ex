
add = fn (a, b) -> a + b end
add.(1, 2) # => 3

shorter_add = &(&1 + &2)
shorter_add.(1, 2) # => 3

repeat = &String.duplicate/2
repeat.("annoy! ", 3)
