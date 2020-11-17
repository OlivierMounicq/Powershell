
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

__Regex__

```ps1                                             
PS C:\> "2020-01-01; Message" -split ";"
``` 
