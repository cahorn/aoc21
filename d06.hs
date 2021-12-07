import Control.Applicative ((<*))
import Text.Parsec

import AoC21Lib

fish fs = map (maybe 0 id . flip lookup (occurences fs)) [0..8]

population generation = sum . (!! generation) . iterate update
  where update (f:fs) = zipWith (+) [0, 0, 0, 0, 0, 0, f, 0, 0] $ fs ++ [f]

part1 = (population 80 . fish) `withParser` (numbers <* endOfLine)

part2 = (population 256 . fish) `withParser` (numbers <* endOfLine)

#include "main.hs"
