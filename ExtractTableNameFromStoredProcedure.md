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

