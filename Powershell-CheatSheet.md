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

__Search files with a given string__

We want to get all files containing the string _newco_

```ps1
PS C:\> Get-ChildItem | Select-string -pattern "newco"
```

------------------------------

__match : pick the nth occurence__

Use the ? (don't be greedy!)

```ps1
PS C:> @("[myDataBase].[dbo].[Table1]","[myDataBase].[dbo].[Table2]") | %{ return [regex]::Matches($_, "\[.*?\]", "IgnoreCase")[2].Value ;}
[Table1]
[Table2]
```

------------------------------
__Git log__


```ps1
function GitLog {
	param( [int]$qty)
	git log --pretty=format:"%h%x09%an%x09%ad%x09%s" -$qty
}
```
