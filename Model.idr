module Model 

import Data.Vect
import Data.Fin

%access public export

data Distribution =
      Uniform Double Double
    | Normal Double Double
    | Exponential Double

record Stock where 
    constructor MkStock
    name : String 
    -- we are using fixed point encoding to represent the price
    price : (Integer, Fin 100)
    dist : Distribution

record Model (n : Nat) where 
    constructor MkModel
    stocks : Vect n Stock
    cash : (Integer, Fin 100)
