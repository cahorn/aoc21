import Data.Char

data Command = Forward Int | Down Int | Up Int deriving Read

pilot1 (h, d) (Forward x) = (h + x, d)
pilot1 (h, d) (Down x) = (h, d + x)
pilot1 (h, d) (Up x) = (h, d - x)

pilot2 (h, d, a) (Forward x) = (h + x, d + a * x, a)
pilot2 (h, d, a) (Down x) = (h, d, a + x)
pilot2 (h, d, a) (Up x) = (h, d, a - x)

capitalize s@(c:cs) = toUpper c : cs

part1 = (\(h, d) -> h * d) . foldl pilot1 (0, 0) . map (read . capitalize) . lines

part2 = (\(h, d, _) -> h * d) . foldl pilot2 (0, 0, 0) . map (read . capitalize) . lines

#include "main.hs"
