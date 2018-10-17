import Control.Monad

main = do 
    putStrLn "cdcd"
    line <- getLine
    putStrLn $ line ++ "enter"
    when (line == "passwd") $ do 
        putStr "next"
        print ['a','r','r','a','y']
    a <- getLine
    print a
    when (read a /= "cd") main
    print "ext"
