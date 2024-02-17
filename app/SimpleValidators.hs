{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE ImportQualifiedPost   #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE ScopedTypeVariables   #-}
{-# LANGUAGE Strict                #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE ViewPatterns          #-}

{-# OPTIONS_GHC -fno-ignore-interface-pragmas #-}
{-# OPTIONS_GHC -fno-omit-interface-pragmas #-}
{-# OPTIONS_GHC -fno-full-laziness #-}
{-# OPTIONS_GHC -fno-spec-constr #-}
{-# OPTIONS_GHC -fno-specialise #-}
{-# OPTIONS_GHC -fno-strictness #-}
{-# OPTIONS_GHC -fno-unbox-strict-fields #-}
{-# OPTIONS_GHC -fno-unbox-small-strict-fields #-}
{-# OPTIONS_GHC -fplugin-opt PlutusTx.Plugin:target-version=1.0.0 #-}


module SimpleValidators where
import PlutusTx (BuiltinData)
import qualified PlutusTx
import qualified PlutusTx.Code

{-# INLINABLE alwaysSucceed #-}
alwaysSucceed :: BuiltinData -> BuiltinData -> BuiltinData -> ()
alwaysSucceed _ _ _ = ()

alwaysSucceedScript :: PlutusTx.Code.CompiledCode (
  BuiltinData ->
  BuiltinData ->
  BuiltinData ->
  ()
  )
alwaysSucceedScript = $$(PlutusTx.compile [|| alwaysSucceed ||])
