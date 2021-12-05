import Control.Applicative ((<*))
import Data.Char
import Data.List
import Text.Parsec
import Text.Parsec.Char
import Text.Parsec.String

bits = many1 (subtract (ord '0') . ord <$> oneOf "01")

linesOf = flip sepEndBy endOfLine

binToDec = foldl (\a b -> 2 * a + b) 0

occurences = map (\x -> (head x, length x)) . sortOn length . group . sort

mostCommon = fst . head . reverse . occurences

leastCommon = fst . head . occurences

withParser :: Show b => (a -> b) -> Parser a -> String -> String
withParser soln parser = either show (show . soln) . parse (parser <* eof) "stdin"

part1 = (\bs -> gamma bs * epsilon bs) `withParser` linesOf bits
  where gamma   = binToDec . map mostCommon . transpose
        epsilon = binToDec . map leastCommon . transpose

rating f bs = let bit    = f . head $ transpose bs
                  remain = map (tail) $ filter ((== bit) . head) bs
              in if length bs == 1 then head bs else bit : rating f remain

part2 = (\bs -> ox bs * co2 bs) `withParser` linesOf bits
  where ox  = binToDec . rating mostCommon
        co2 = binToDec . rating leastCommon

#ifndef PART2
main = interact part1 >> putStrLn ""
#else
main = interact part2 >> putStrLn ""
#endif
