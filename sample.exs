IO.puts "Hello world"

add = fn a, b -> a + b end
IO.puts add.(10, 5)

# `List` is a linked list
IO.inspect [1, 2, 3] ++ [4, 5, 6]

# `tuple` is an array
IO.inspect {:a, :b, true, [1, 2], {"test", 'char list'}, nil}

IO.puts 'single quote is a char list'
IO.puts "double quote is a string"

{a, b, c} = {"pattern", "match", "example"}
IO.puts a
IO.puts b
IO.puts c

[head | tail] = [1, 2, 3, 4, 5]
IO.puts head
IO.inspect tail
IO.inspect [:hoge | tail]

pinned = 10
# By using pin operator, you can prohibit rebound the variable
^pinned = 10
# pinned = 0
# #=> ** (MatchError) no match of right hand side value: 0

case {1, 2, 3} do
  {4, 5, 6} ->
    "Never run"
  {1, x, 3} ->
    IO.puts x
  _ ->
    "match any value"
end

case {1, 2, 3} do
  {1, x, 3} when x < 0 ->
    "Never run"
  {1, x, 3} ->
    IO.puts x
  _ ->
    "match any value"
end

cond do
  2 + 2 == 5 ->
    "Never run"
  1 + 1 == 2 ->
    IO.puts "Hi"
  1 + 2 >= 3 ->
    "Never run"
end

f = "ふるはま"
IO.puts byte_size(f) #=> 12
IO.puts String.length(f) #=> 4

keyword_list = [{:a, 1}, {:b, 2}] #=> [a: 1, b: 2]
IO.inspect keyword_list
IO.inspect [a: 0] ++ keyword_list
IO.puts ([a: 0] ++ keyword_list)[:a] #=> 0

map = %{:a => 1, 2 => :b}
IO.puts map[2]
IO.puts map.a

odd? = &(rem(&1, 2) != 0)
IO.puts 1..100_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(odd?) |> Enum.sum

stream = Stream.cycle([1, 2, 3])
IO.inspect Enum.take(stream, 10)

pid = spawn fn -> 1 + 2 end
Process.sleep(500)
IO.puts Process.alive?(pid)
IO.puts Process.alive?(self())
