The purpose : find a string in different files (located in the same directory) and return the name of the files containing this string

```ps1
PS C:>Get-ChildItem | Select-string -pattern "newco" |  %{ return $_.FileName} | Get-Unique
```
