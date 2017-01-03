module Main

import Data.Vect

record Stock where 
    constructor MkStock
    name : String 
    -- we are using fixed point encoding to represent the price
    price : (Int, Int)

record Model (n : Nat) where 
    constructor MkModel
    stocks : Vect n Stock

printHeader : IO ()
printHeader = do
    putStrLn "Some sort of trading game"

main : IO ()
main = do
    printHeader
    putStrLn "Yup"
