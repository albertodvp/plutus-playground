# Plutus playground
This project is a simple exmperiment to compile Plutus scripts using plutus-tx. The aim is make the system work with a resonably recent version of GHC using nix flakes without using over-engineered and/or undocumented unecessary flakes.

Using the flake defined in the project, we get this error:
```
error: builder for '/nix/store/c70cypp031sgpcymsdvap7glg33s5lwc-plutus-core-lib-plutus-core-1.7.0.0.drv' failed with exit code 1;
       last 10 log lines:
       >       Expected: Either Context Info
       >         Actual: Context
       >     • In the first argument of ‘ThunkInfo’, namely ‘ctx’
       >       In the second argument of ‘($)’, namely ‘ThunkInfo ctx’
       >       In the expression: pure . Just $ ThunkInfo ctx
       >    |
       > 41 |         BuiltinResult _ _          -> pure . Just $ ThunkInfo ctx
       >    |                                                               ^^^
       > [138 of 165] Compiling UntypedPlutusCore.Evaluation.Machine.Cek.CekMachineCosts ( untyped-plutus-core/src/UntypedPlutusCore/Evaluation/Machine/Cek/CekMachineCosts.hs, dist/build/UntypedPlutusCore/Evaluation/Machine/Cek/CekMachineCosts.o, dist/build/UntypedPlutusCore/Evaluation/Machine/Cek/CekMachineCosts.dyn_o )
       > [140 of 165] Compiling UntypedPlutusCore.Evaluation.Machine.Cek.StepCounter ( untyped-plutus-core/src/UntypedPlutusCore/Evaluation/Machine/Cek/StepCounter.hs, dist/build/UntypedPlutusCore/Evaluation/Machine/Cek/StepCounter.o, dist/build/UntypedPlutusCore/Evaluation/Machine/Cek/StepCounter.dyn_o )
       For full logs, run 'nix log /nix/store/c70cypp031sgpcymsdvap7glg33s5lwc-plutus-core-lib-plutus-core-1.7.0.0.drv'.
error: 1 dependencies of derivation '/nix/store/4qpyw5zf6rjdix63ariddfhvx07g34pa-plutus-playground-exe-plutus-playground-0.1.0.0-env.drv' failed to build
```


If we use the shell provided by `nix develop github:IntersectMBO/plutus`, the project runs correctly.


