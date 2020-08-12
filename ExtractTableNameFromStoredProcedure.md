## Extract the table name from stored procedure files

We have a bunch of stored procedure files. And we want extract the tables stored in a database named _Newco_. And we want to list the tables (in the _Newco_ database) depending on the stored procedure and we want to list the stored procedures depending on the table name.


### 1/ Get the table names depending on the stored procedure

The powershell cmdlet :

```ps1
Get-ChildItem | Select-String -pattern "newco" | %{ return [pscustomobject] @{ StoredProcedure = $_.FileName; Str = $_.Line} ; } | %{ return [pscustomobject] @{ StoredProcedure = $_.StoredProcedure; Arr = ([regex]::Matches($_.Str, "Newco\]{0,1}\.(.*?)\s", "IgnoreCase")) } } | Select-Object *  -ExpandProperty Arr  | %{ return [pscustomobject] @{ StoredProcedure = ($_.StoredProcedure -split "\.")[1] ; TableName = (($_.Value -split "\.")[2]) -replace "\[", "" -replace "\]" , "" } } | Select-Object StoredProcedure, TableName -Unique | Sort StoredProcedure, TableName
```


```ps1
Get-ChildItem 
| 
Select-String -pattern "newco" 
| 
%{ return [pscustomobject] @{ StoredProcedure = $_.FileName; Str = $_.Line} ; } 
| 
%{ 
  return [pscustomobject] @{ 
    StoredProcedure = $_.StoredProcedure; 
    Arr = ([regex]::Matches($_.Str, "Newco\]{0,1}\.(.*?)\s", "IgnoreCase")) 
    } 
 } 
| 
Select-Object *  -ExpandProperty Arr  
| 
%{ 
  return [pscustomobject] @{ 
    StoredProcedure = ($_.StoredProcedure -split "\.")[1] ; 
    TableName = (($_.Value -split "\.")[2]) -replace "\[", "" -replace "\]" , "" 
    } 
  } 
| 
Select-Object StoredProcedure, TableName -Unique 
| 
Sort StoredProcedure, TableName
```

And the cmdlet returns 

```console
StoredProcedure                               TableName
---------------                               ---------
GetDetailHistoriqueValorisationByCGPAndClient CGP
GetDetailHistoriqueValorisationByCGPAndClient Compte
GetDetailHistoriqueValorisationByCGPAndClient CompteDetail
GetDetailHistoriqueValorisationByCGPAndClient Envelope
GetDetailHistoriqueValorisationByCGPAndClient SocieteCGP
GetDetailHistoriqueValorisationByCGPAndClient Titulaire
GetDetailHistoriqueValorisationByCGPAndClient TitulaireCompte
GetHistoriqueValorisationByCGPAndClient       CGP
GetHistoriqueValorisationByCGPAndClient       Compte
GetHistoriqueValorisationByCGPAndClient       CompteDetail
GetHistoriqueValorisationByCGPAndClient       Envelope
GetHistoriqueValorisationByCGPAndClient       SocieteCGP
GetHistoriqueValorisationByCGPAndClient       TitulaireCompte
```

### 2/ Get the stored procedure depending on the stored procedure

```ps1
Get-ChildItem | Select-String -pattern "newco" | %{ return [pscustomobject] @{ StoredProcedure = $_.FileName; Str = $_.Line} ; } | %{ return [pscustomobject] @{ StoredProcedure = $_.StoredProcedure; Arr = ([regex]::Matches($_.Str, "Newco\]{0,1}\.(.*?)\s", "IgnoreCase")) } } | Select-Object *  -ExpandProperty Arr  | %{ return [pscustomobject] @{ StoredProcedure = ($_.StoredProcedure -split "\.")[1] ; TableName = (($_.Value -split "\.")[2]) -replace "\[", "" -replace "\]" , "" } } | Select-Object StoredProcedure, TableName -Unique | Sort StoredProcedure, TableName | Group-Object TableName | %{ return $_.Group;} | Select-Object TableName, StoredProcedure
```

```ps1
Get-ChildItem | Select-String -pattern "newco" 
| 
%{ return [pscustomobject] @{ StoredProcedure = $_.FileName; Str = $_.Line} ; } 
| 
%{ 
  return [pscustomobject] @{ 
    StoredProcedure = $_.StoredProcedure; 
    Arr = ([regex]::Matches($_.Str, "Newco\]{0,1}\.(.*?)\s", "IgnoreCase")) 
    } 
  } 
| 
Select-Object *  -ExpandProperty Arr  
| 
%{ 
  return [pscustomobject] @{ 
    StoredProcedure = ($_.StoredProcedure -split "\.")[1] ; 
    TableName = (($_.Value -split "\.")[2]) -replace "\[", "" -replace "\]" , "" 
    } 
  } 
| 
Select-Object StoredProcedure, TableName -Unique 
| 
Sort StoredProcedure, TableName 
| 
Group-Object TableName 
| 
%{ 
  return $_.Group;
} 
| 
Select-Object TableName, StoredProcedure
```

And the cmdlet returns

```console
TableName                        StoredProcedure
---------                        ---------------
CGP                              GetDetailHistoriqueValorisationByCGPAndClient
CGP                              GetHistoriqueValorisationByCGPAndClient
CGP                              GetListClientForCGP
CGP                              GetNewcoCgpAndAccounts
CGP                              GetValorisationByCGPAndClient
CGP                              GetValorisationByCGPAndClientByYear
CGP                              spCALCUL_COMPTE_DDG_STEP_INITIAL
CGP                              spGetDerogationsComptesTauxRetrocession
CGP                              spGetMonthlyDetailInfosDroitsEntreeCgp
CGP                              spIMPORT_ASSURANCE_VIE_DROIT_ENTREE
CGP                              spIMPORT_ASSURANCE_VIE_ENCOURS_GA
CGP                              spIMPORT_ASSURANCE_VIE_ENCOURS_GO
CGP                              spIMPORT_ASSURANCE_VIE_ENCOURS_UC
CGP                              spIMPORT_ASSURANCE_VIE_FRAIT_ARBITRAGE
CGP                              spLoadAccountCgpSocieteCgp
CGP                              spUPDATE_EXONERATION_FOND_DDG_STEP_3
Compte                           GetDetailHistoriqueValorisationByCGPAndClient
Compte                           GetHistoriqueValorisationByCGPAndClient
Compte                           GetListClientForCGP
Compte                           GetNewcoCgpAndAccounts
```
