import Data.Char
import Data.List
import Text.Parsec

import AoC21Lib

bits = many1 (subtract (ord '0') . ord <$> oneOf "01")

binToDec = foldl (\a b -> 2 * a + b) 0

occurences = map (\x -> (head x, length x)) . sortOn length . group . sort

mostCommon = fst . head . reverse . occurences

leastCommon = fst . head . occurences

part1 = (\bs -> gamma bs * epsilon bs) `withParser` linesOf bits
  where gamma   = binToDec . map mostCommon . transpose
        epsilon = binToDec . map leastCommon . transpose

rating f bs = let bit    = f . head $ transpose bs
                  remain = map (tail) $ filter ((== bit) . head) bs
              in if length bs == 1 then head bs else bit : rating f remain

part2 = (\bs -> ox bs * co2 bs) `withParser` linesOf bits
  where ox  = binToDec . rating mostCommon
        co2 = binToDec . rating leastCommon

#include "main.hs"
