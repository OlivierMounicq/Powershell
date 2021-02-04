## PowerShell Cheat Sheet


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

__Substring__

```ps1                                             
PS C:\> "2020-11-01 00:00:00".substring(0,10)
``` 

------------------------------

__Regex__

```ps1                                             
PS C:\> [Regex]::Matches("There are 123 lines", "(\d+)", "IgnoreCase")[0]
``` 

------------------------------

__match__

To determine if the string contains a substring

```ps1                                             
PS C:\>  "Albert Einstein [Germany]" -match "\[Germany\]"
True
``` 

------------------------------

__match : pick the nth occurence__

Use the ? (don't be greedy!)

```ps1
PS C:> @("[myDataBase].[dbo].[Table1]","[myDataBase].[dbo].[Table2]") | %{ return [regex]::Matches($_, "\[.*?\]", "IgnoreCase")[2].Value ;}
[Table1]
[Table2]
```
