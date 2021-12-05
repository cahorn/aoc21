module AoC21Lib where

import Control.Applicative ((<*))
import Text.Parsec
import Text.Parsec.String

linesOf :: Parser a -> Parser [a]
linesOf = flip sepEndBy endOfLine

withParser :: Show b => (a -> b) -> Parser a -> String -> String
withParser soln parser = either show (show . soln) . parse (parser <* eof) "stdin"
