#The purpose : find a string in different files and return the name of the files containing this string

PS C:>Get-ChildItem | Select-string -pattern "newco" |  %{ return $_.FileName} | Get-Unique
