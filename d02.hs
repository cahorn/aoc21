import Data.Char

import AoC21Lib

data Command = Forward Int | Down Int | Up Int deriving Read

capitalize = unlines . map (\(c:cs) -> toUpper c : cs) . lines

pilot1 (h, d) (Forward x) = (h + x, d)
pilot1 (h, d) (Down x) = (h, d + x)
pilot1 (h, d) (Up x) = (h, d - x)

part1 = (pilot `withParser` readLines) . capitalize
  where pilot = (\(h, d) -> h * d) . foldl pilot1 (0, 0)

pilot2 (h, d, a) (Forward x) = (h + x, d + a * x, a)
pilot2 (h, d, a) (Down x) = (h, d, a + x)
pilot2 (h, d, a) (Up x) = (h, d, a - x)

part2 = (pilot `withParser` readLines) . capitalize
  where pilot = (\(h, d, _) -> h * d) . foldl pilot2 (0, 0, 0)

#include "main.hs"
