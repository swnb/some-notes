#!/usr/bin/env runhaskell

data Some = Double :++++ Double

arounf :: Double -> Double -> Double
arounf x y = x+y

add :: Some -> Double
add a = 
    case a of ((:++++) x y) -> arounf x y

data Pos = MakePosition{ getX :: Float , getY :: Float }

main = do 
    print $ add (100.20 :++++ 2.0)