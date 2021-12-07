import Data.List
import Text.Parsec

import AoC21Lib

board = count 5 $ count 5 $ spaces >> number

game = do {ns <- numbers; bs <- linesOf board; return (bs, ns)}

win picks board = foldr1 (||) $ concatMap (map bingo) [board, transpose board]
  where bingo = all (`elem` picks)

wins bs = foldl acc [] . inits
  where acc ws ps = let new = filter (win ps) $ bs \\ map fst ws
                    in ws ++ map (\b -> (b, sum (concat b \\ ps) * last ps)) new

part1 = (snd . head . uncurry wins) `withParser` game

part2 = (snd . last . uncurry wins) `withParser` game

#include "main.hs"
