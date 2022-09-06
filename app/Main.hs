module Main where

import Test.HUnit
import Test.QuickCheck

sumOfSquares :: Int -> Int -> Int
sumOfSquares x y = x^2 + y*2

main :: IO ()
main = do
    -- let hUnitTest = TestCase (assertEqual "sumOfSquares 0 0 " 0 (sumOfSquares 0 0))
    -- hUnitTestCount <- runTestTT hUnitTest
    -- putStrLn $ "0^2 + 0^2 == 0 :: " ++ show hUnitTestCount
    
    -- let hUnitTest = TestCase (assertEqual "sumOfSquares 3 4 " 25 (sumOfSquares 3 4))
    -- hUnitTestCount <- runTestTT hUnitTest
    -- putStrLn $ "3^2 + 4^2 == 25 :: " ++ show hUnitTestCount
    
    hUnitTestCount <- runTestTT (test
        [ 9 * 9 + 1 ~=? sumOfSquares 9 1 -- expected ~=? got
        ,        25 ~=? sumOfSquares 3 4
        ,         0 ~=? sumOfSquares 0 0
        ])
    putStrLn $ "hUnitTests = " ++ show hUnitTestCount
    
    putStrLn "Checking for (x^2 + 1^2) = (x*x + 1)"
    quickCheck (\ x -> sumOfSquares x 1 == x * x + 1)
    
    putStrLn "Checking for (x^2 + y^2) = (y^2 + x^2)"
    quickCheck (\ x y -> sumOfSquares x y == sumOfSquares y x)
