{-# OPTIONS_GHC -fno-warn-warnings-deprecations -fno-warn-unused-binds #-}

import CodeWorld

main :: IO ()
main = animationOf bloomAnimation

tree :: Picture -> Integer -> Picture
tree t 0 = t
tree t n =
  translated 0 1 (rotated (pi / 10) (tree t (n - 1)) & rotated (-pi / 10) (tree t (n - 1)))
    & curve [(0, 0), (0, 1)]

bloom :: Double -> Picture
bloom t = colored pink (solidCircle (min t 10 / 50))

bloomAnimation :: Double -> Picture
bloomAnimation t = tree (bloom t) 8
