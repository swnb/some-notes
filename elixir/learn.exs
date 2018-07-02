IO.puts(
  (fn ->
     case 1 do
       x when hd(x) ->
         "not match"

       x ->
         "x->#{x}"
     end
   end).()
)

f = fn
  x, y when x > 0 and y > 0 -> x + y
  x, y -> x * y
end

IO.puts(f.(1, 11))

IO.puts(is_number(if true, do: 1 + 2))

String.codepoints("cdc")

defmodule Recur do
  def s([], sum) do
    sum
  end

  def s([head | tail], sum) do
    sum = sum + head
    s(tail, sum)
  end
end

IO.puts(Recur.s([1, 2, 3, 4, 5, 6, 7], 0))
