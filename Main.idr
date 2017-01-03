module Main

import Data.Vect
import Data.String 

import Effects
import Effect.Random
import Effect.System

import Model
import Generate

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
    xs <- run (genStocks seed 5)
    putStrLn . show $ map name xs
