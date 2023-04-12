{-# OPTIONS_GHC -fno-warn-warnings-deprecations -fno-warn-unused-binds #-}

import CodeWorld

main :: IO ()
main = exercise

tree :: Integer -> Picture
tree 0 = blank
tree n =
  curve [(0, 0), (0, 1)]
    & translated
      0
      1
      ( rotated (pi / 10) (tree (n - 1)) & rotated (-pi / 10) (tree (n - 1))
      )

bloom :: Integer -> Picture
bloom t
  | t < 10 = tree t
  | otherwise = tree 10

bloomAnimation :: Double -> Picture
bloomAnimation t = bloom (round t)

exercise :: IO ()
exercise = animationOf bloomAnimation
