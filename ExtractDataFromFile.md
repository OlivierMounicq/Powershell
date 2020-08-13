## Extract data from file

We have this file and we want to extract the name 




```ps1
@(Get-Content .\Warnings.txt) | %{ return [pscustomobject] @{ LineNumber = $_.ReadCount; Content = $_ } } | %{ if($_.Content.StartsWith("The module")){ return $_; } } | %{ return [pscustomobject] @{ LineNumber = $_.LineNumber; Data = [regex]::Matches($_.Content, "'(.*?)'", "IgnoreCase");} } | Select-Object * -ExpandProperty Data | Group-Object LineNumber | %{ return [pscustomobject] @{ LineNumber = $_.Name; Field1 = $_.Group[0].Value; Field2 = $_.Group[1].Value } }
```
