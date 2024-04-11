import Data.Char

main :: IO ()
main = do
    input <- getLine
    let inputs = words input
    let n = read (head inputs) :: Int
    let numbers = map read (tail inputs) :: [Int]
    let count = sum [digitSum num | num <- take n numbers]
    print count

digitSum :: Int -> Int
digitSum 0 = 0
digitSum num = let (quotient, remainder) = num `divMod` 10
                in if remainder `mod` 3 == 0
                   then remainder + digitSum quotient
                   else digitSum quotient
