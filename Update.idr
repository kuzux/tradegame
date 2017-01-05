module Update

import Effects
import Effect.Random

import Model

%access public export

updatePrices : Model n -> Eff (Model n) [RND]
updatePrices m = pure m
