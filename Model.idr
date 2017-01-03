module Model 

import Data.Vect

%access public export

record Stock where 
    constructor MkStock
    name : String 
    -- we are using fixed point encoding to represent the price
    price : (Integer, Fin 100)

record Model (n : Nat) where 
    constructor MkModel
    stocks : Vect n Stock
