{-# OPTIONS_GHC -fno-warn-warnings-deprecations -fno-warn-unused-binds #-}

import CodeWorld

main :: IO ()
main = exercise

lightInfo :: Color -> Double -> Picture
lightInfo c dx = colored c (translated 0 dx (solidCircle 1))

frame :: Picture
frame = rectangle 2.5 7.5

trafficLight :: Color -> Color -> Color -> Picture
trafficLight c1 c2 c3 = lightInfo c1 2.5 & lightInfo c2 0 & lightInfo c3 (-2.5) & frame

trafficController :: Integer -> Picture
trafficController t
  | t < 2 = trafficLight black black green
  | t == 2 = trafficLight black yellow black
  | t > 2 && t < 5 = trafficLight red black black
  | otherwise = trafficLight red yellow black

trafficLightAnimation :: Double -> Picture
trafficLightAnimation t = trafficController (round t `mod` 6)

exercise :: IO ()
exercise = animationOf trafficLightAnimation
