module Update

import Effects
import Effect.Random

import Model

%access public export

data Message = 
      Noop
    | Buy Integer Integer
    | Sell Integer Integer

updatePrices : Message -> Model n -> Eff (Model n) [RND]
updatePrices msg prev = pure prev
