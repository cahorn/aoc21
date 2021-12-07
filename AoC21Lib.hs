module AoC21Lib where

import Control.Applicative ((<*))
import Data.List
import Text.Parsec
import Text.Parsec.String

linesOf :: Parser a -> Parser [a]
linesOf = flip endBy endOfLine

number :: Parser Int
number = read <$> many1 digit

numbers = sepBy1 number (char ',')

occurences :: Ord a => [a] -> [(a, Int)]
occurences = map (\x -> (head x, length x)) . sortOn length . group . sort

readLine :: Read a => Parser a
readLine = read <$> many (noneOf "\r\n")

readLines :: Read a => Parser [a]
readLines = linesOf readLine

withParser :: Show b => (a -> b) -> Parser a -> String -> String
withParser soln parser = either show (show . soln) . parse (parser <* eof) "stdin"
