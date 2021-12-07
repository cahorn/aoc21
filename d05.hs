import Text.Parsec

import AoC21Lib

data LineSegment = LineSegment (Int, Int) (Int, Int)

lineSegment = do
  x1 <- number; char ','; y1 <- number; string " -> "
  x2 <- number; char ','; y2 <- number; return $ LineSegment (x1, y1) (x2, y2)

orthogonal (LineSegment (x1, y1) (x2, y2)) = x1 == x2 || y1 == y2

toPoints (LineSegment (x1, y1) (x2, y2)) = zip (x1 `countTo` x2) (y1 `countTo` y2)
  where countTo a b = [a, a + signum (b - a)..b]

overlaps = length . filter ((>1) . snd) . occurences . concatMap toPoints

part1 = (overlaps . filter orthogonal) `withParser` linesOf lineSegment 

part2 = overlaps `withParser` linesOf lineSegment 

#include "main.hs"
