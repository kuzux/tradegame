module Main

import Data.Vect
import Data.String

import Effects
import Effect.Random
import Effect.System

import Model
import Generate
import Update
import Init

printHeader : IO ()
printHeader = do
    putStrLn "Some sort of trading game"

getSeed : Eff Integer [SYSTEM]
getSeed = do 
    [_, arg] <- getArgs | [] => pure 0
                        | [_] => pure 0
                        | _ => pure 0
    case parseInteger arg of
        Just a => pure a
        Nothing => pure 0

main : IO ()
main = do
    printHeader
    seed <- run getSeed
    run $ srand seed
    xs <- run (genStocks 5)
    putStrLn . show $ map (fst . price) xs
