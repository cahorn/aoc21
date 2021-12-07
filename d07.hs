import Control.Applicative ((<*))
import Text.Parsec

import AoC21Lib

fuel p = sum . map (abs . (p-))

minima metric crabs = minimum $ map (flip metric crabs) [minimum crabs..maximum crabs]

part1 = minima fuel `withParser` (numbers <* endOfLine)

fuel2 p = sum . map (sum . (1 `enumFromTo`) . abs . (p-))

part2 = minima fuel2 `withParser` (numbers <* endOfLine)

#include "main.hs"
