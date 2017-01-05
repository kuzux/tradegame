module Generate

import Data.Vect

import Effects
import Effect.Random

import Model

randomNames : List String 
randomNames = ["ACME Corp.", "Osborne Industries", "Skynet", "Neuschwabenland GmbH"]

genStock : Eff Stock [RND]
genStock = do
    let name = maybe "" id !(rndSelect randomNames)
    dols <- rndInt 0 100
    cents <- rndFin 99
    pure $ MkStock name (dols, cents) (Uniform 3 5)

export
genStocks : (m : Nat) -> Eff (Vect m Stock) [RND]
genStocks Z = pure []
genStocks (S y) = do
    st <- genStock
    pure $ st :: !(genStocks y)

genStdUniform : Eff Double [RND]
genStdUniform = do
    r <- rndInt 0 1000000
    pure $ (fromInteger r) / 1000000.0

genUniform : Double -> Double -> Eff Double [RND]
genUniform start stop = do
    r <- genStdUniform
    pure $ r * diff + start
 where diff = stop - start

-- get a variable with mean = 0 and variance = 1
-- using box-mueller transform
genStdNormal : Eff Double [RND]
genStdNormal = do
    x1 <- genStdUniform
    x2 <- genStdUniform 
    pure $ sqrt ( -2 * log x1 ) * cos ( 2 * pi * x2)

genNormal : Double -> Double -> Eff Double [RND]
genNormal mean var = do
    n <- genStdNormal
    pure $ n * var + mean 

genExponential : Double -> Eff Double [RND]
genExponential lambda = do 
    u <- genStdUniform
    pure $ -(log u) / lambda

export 
genRandomVar : Distribution -> Eff Double [RND]
genRandomVar (Uniform start stop) = genUniform start stop
genRandomVar (Normal mean var) = genNormal mean var
genRandomVar (Exponential lambda) = genExponential lambda
