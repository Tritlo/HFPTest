module Main where

import Foreign.C
import FFI.Anything.TypeUncurry.Msgpack

import Data.List

foreign export ccall someFunc_export :: CString -> IO CString
someFunc_export = exportIO someFunc

someFunc :: Int -> IO Int
someFunc x = do
    putStrLn $ show x ++ " came from python!"
    return (x+1)

sortIt :: [Int] -> [Int]
sortIt = sort

foreign export ccall sortIt_export :: CString -> IO CString
sortIt_export = export sortIt

main :: IO ()
main = return ()
