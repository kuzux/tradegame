module Init

import Data.Vect

import Effects
import Effect.Random

import Model
import Generate

%access public export

init : Eff (Model 5) [RND]
init = do
    pure $ MkModel !(genStocks 5) (35, !(rndFin 99))