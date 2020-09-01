

Get the file quantity per directory

```ps
PS C:> Get-ChildItem -Directory | %{ return [pscustomobject] @{ Directory = $_.Name; Quantity = (Get-ChildItem * -Path $_.FullName).Count } } > FileQuantityPerFolder.txt  
```
