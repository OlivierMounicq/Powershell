## Extract data from file

We have this file and we want to extract the name the stored procedures:


```txt
The module 'GetFeeFirstMethod' depends on the missing object 'spGetFeeFirstMethod'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spAddPromoteursToClient' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spApplyMethodAndFacturationToClients' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spCALCUL_COMPTE_DDG' depends on the missing object 'dbo.spGet_DATE_CALCUL_DDG'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spCALCUL_COMPTE_DDG' depends on the missing object 'dbo.spCALCUL_COMPTE_DDG_STEP_INITIAL'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spCALCUL_COMPTE_DDG' depends on the missing object 'dbo.spUPDATE_EXONERATION_COMPTE_DDG_STEP_2'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spCALCUL_COMPTE_DDG' depends on the missing object 'dbo.spUPDATE_EXONERATION_FOND_DDG_STEP_3'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spCALCUL_COMPTE_DDG' depends on the missing object 'dbo.spUPDATE_EXONERATION_FOND_DDG_STEP_3Bis_W6'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spCALCUL_COMPTE_DDG' depends on the missing object 'dbo.spUPDATE_TARIFICATION_FORFAIT_STEP_4'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spCALCUL_COMPTE_DDG' depends on the missing object 'dbo.spUPDATE_TARIFICATION_PALIER_STEP_5'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spCALCUL_COMPTE_DDG' depends on the missing object 'dbo.spCALCUL_COMPTE_DDG_STEP_FINALE'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spCREATE_EVENTS' depends on the missing object 'dbo.spFILL_ATTESTATION_EVENEMENT'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spDeletePositionDepositaireByIdEvenement' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spFillOPCVMCentral' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spFillOPCVMCentral.old' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spFillOPCVMCentral_25012019' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spFUSION_ASSURANCE_VIE_EC' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spGetEncoursForAllSousDistributeurs' depends on the missing object 'spGetEncoursForSousDistributeursInternal'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spGetEncoursForOneSousDistributeur' depends on the missing object 'spGetEncoursForSousDistributeursInternal'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spGetFeeSecondMethod' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spGetFeeSecondMethod_Test' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_ASSURANCE_VIE_DROIT_ENTREE' depends on the missing object 'dbo.spUPDATE_INCOMP_RETRO_ASSURANCE_VIE_DE'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_ASSURANCE_VIE_DROIT_ENTREE' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_ASSURANCE_VIE_ENCOURS_GA' depends on the missing object 'dbo.spUPDATE_INCOMP_RETRO_ASSURANCE_VIE_EC_GA_FG'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_ASSURANCE_VIE_ENCOURS_GA' depends on the missing object 'dbo.spUPDATE_INCOMP_RETRO_ASSURANCE_VIE_EC_GA_UC'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_ASSURANCE_VIE_ENCOURS_GA' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_ASSURANCE_VIE_ENCOURS_GO' depends on the missing object 'dbo.spUPDATE_INCOMP_RETRO_ASSURANCE_VIE_EC_GO'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_ASSURANCE_VIE_ENCOURS_GO' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_ASSURANCE_VIE_ENCOURS_UC' depends on the missing object 'dbo.spUPDATE_INCOMP_RETRO_ASSURANCE_VIE_EC_UC'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_ASSURANCE_VIE_ENCOURS_UC' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_ASSURANCE_VIE_FRAIT_ARBITRAGE' depends on the missing object 'dbo.spUPDATE_INCOMP_RETRO_ASSURANCE_VIE_FA'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_ASSURANCE_VIE_FRAIT_ARBITRAGE' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_BROUILLARD_DDG' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_DATACARAC' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_DATAVL' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_MOUVEMENT' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spIMPORT_POSITION' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spImportPromoteurs' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spImportPromoteurs.old' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.
The module 'spInsertFinaveo2Positions' depends on the missing object 'dbo.spPrintError'. The module will still be created; however, it cannot run successfully until the object exists.

Msg 2715, Level 16, State 3, Procedure spUPDATE_REFERENTIEL_MASSE, Line 5 [Batch Start Line 13882]
Column, parameter, or variable #1: Cannot find data type dbo.ClientType.
Parameter or variable '@client' has an invalid data type.

Msg 2715, Level 16, State 3, Procedure spUPDATE_REFERENTIEL_MASSE, Line 6 [Batch Start Line 13882]
Column, parameter, or variable #2: Cannot find data type dbo.Opcvm_DistributeurType.
Parameter or variable '@opcvm_distributeur' has an invalid data type.

Msg 1087, Level 16, State 1, Procedure spUPDATE_REFERENTIEL_MASSE, Line 14 [Batch Start Line 13882]
Must declare the table variable "@client".

Msg 1087, Level 16, State 1, Procedure spUPDATE_REFERENTIEL_MASSE, Line 14 [Batch Start Line 13882]
Must declare the table variable "@opcvm_distributeur".

Completion time: 2020-08-13T18:22:10.9829572+02:00

```




```ps1
@(Get-Content .\Warnings.txt) | %{ return [pscustomobject] @{ LineNumber = $_.ReadCount; Content = $_ } } | %{ if($_.Content.StartsWith("The module")){ return $_; } } | %{ return [pscustomobject] @{ LineNumber = $_.LineNumber; Data = [regex]::Matches($_.Content, "'(.*?)'", "IgnoreCase");} } | Select-Object * -ExpandProperty Data | Group-Object LineNumber | %{ return [pscustomobject] @{ LineNumber = $_.Name; Field1 = $_.Group[0].Value; Field2 = $_.Group[1].Value } }
```



```ps1
@(Get-Content .\Warnings.txt) 
| 
%{ 
  return [pscustomobject] @{ 
    LineNumber = $_.ReadCount; 
    Content = $_ 
  } 
} 
| 
%{ 
  if($_.Content.StartsWith("The module"))
  { 
    return $_; 
  } 
} 
| 
%{ 
  return [pscustomobject] @{ 
    LineNumber = $_.LineNumber; 
    Data = [regex]::Matches($_.Content, "'(.*?)'", "IgnoreCase");
  } 
} 
| 
Select-Object * -ExpandProperty Data 
| 
Group-Object LineNumber 
| 
%{ 
  return [pscustomobject] @{ 
    LineNumber = $_.Name; 
    Field1 = $_.Group[0].Value; 
    Field2 = $_.Group[1].Value 
  } 
}
```
