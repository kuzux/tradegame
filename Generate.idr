module Generate

import Data.Vect

import Effects
import Effect.Random
import Effect.System

import Model

randomNames : List String 
randomNames = ["ACME Corp.", "Osborne Industries", "Skynet", "Neuschwabenland GmbH"]

genStock : Eff Stock [RND]
genStock = do
    let name = maybe "" id !(rndSelect randomNames)
    dols <- rndInt 0 100
    cents <- rndFin 99
    pure $ MkStock name (dols, cents)

genStocks' : (m : Nat) -> Eff (Vect m Stock) [RND]
genStocks' Z = pure []
genStocks' (S y) = do
    st <- genStock
    pure $ st :: !(genStocks' y)

export
genStocks : Integer -> (m : Nat) -> Eff (Vect m Stock) [RND]
genStocks seed n = do 
    srand seed
    genStocks' n
