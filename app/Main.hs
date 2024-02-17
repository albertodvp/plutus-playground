module Main where

import SimpleValidators

import Data.ByteString qualified as B
import Data.ByteString.Base16 qualified as Base16
import Data.ByteString.Short qualified as B
import PlutusLedgerApi.V2 qualified as V2

main :: IO ()
main = saveFileUPLC
  where
    saveFileUPLC = B.writeFile "validator.uplc" . Base16.encode $ B.fromShort serialisedScript
    serialisedScript = V2.serialiseCompiledCode alwaysSucceedScript
