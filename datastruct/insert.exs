ExUnit.start()

defmodule IndexTest do
    use ExUnit.Case

    test "speed" do 
        {mico,res}=:timer.tc fn -> 
            Enum.reduce 1..10000,[],&(List.insert_at(&2,0,&1))
        end
        IO.puts mico
        {mico,res}=:timer.tc fn -> 
            Enum.reduce 1..10000,[],&(List.insert_at(&2,-1,&1))
        end
        IO.puts mico
    end
end