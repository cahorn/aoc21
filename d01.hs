increased l@(d:ds) = length . filter (>0) $ zipWith (-) ds l

window l@(a:m@(b:n)) = zipWith (+) n (zipWith (+) m l)

part1 = increased . map read . lines

part2 = increased . window . map read . lines

#include "main.hs"
