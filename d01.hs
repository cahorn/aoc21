import AoC21Lib

increased l@(d:ds) = length . filter (>0) $ zipWith (-) ds l

part1 = increased `withParser` readLines

window l@(a:m@(b:n)) = zipWith (+) n (zipWith (+) m l)

part2 = (increased . window) `withParser` readLines

#include "main.hs"
