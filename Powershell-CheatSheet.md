PowerShell Cheat Sheet


__Get only directory__
```ps1                                             
Get-ChildItem MyDir -Directory -Recurse
``` 
------------------------------

__Get only files__
```ps1                                             
Get-ChildItem MyDir -File -Recurse
``` 

------------------------------

__Split__

```ps1                                             
PS C:\> "2020-01-01; Message" -split ";"
``` 
------------------------------

__Join__

```ps1                                             
PS C:\> ("Albert", "Einstein") -join " "
``` 

------------------------------

__Regex__

```ps1                                             
PS C:\> [Regex]::Matches("There are 123 lines", "(\d+)", "IgnoreCase")[0]
``` 
