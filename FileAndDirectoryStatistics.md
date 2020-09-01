

### 1/Get the global file in a directory

Let a directory with sub-folders, we want to get the global quantity of files:

```ps1
PS C:> Get-ChildItem MyDirectory -File -Recurse | Measure-Object
```

### 2/Get the file quantity per sub-directory

```ps1
PS C:> Get-ChildItem -Directory | %{ return [pscustomobject] @{ Directory = $_.Name; Quantity = (Get-ChildItem * -Path $_.FullName).Count } } > FileQuantityPerFolder.txt  
```

### 3/Get the file quantity per sub-directory and the order the output

Lets imagine that in the directory _MyDirectory_, the folder name pattern is like dd-MM-yyyy (french date format) and we want to be able to sort by date the sub-folders. So we have to extract the date from the folder's name :

```ps1
PS C:\> Get-ChildItem MyDirectory -Directory | %{ return [pscustomobject] @{ Directory = $_.Name; Quantity = (Get-ChildItem * -Path $_.FullName).Count ; Date = ([datetime]::ParseExact($_.Name,"dd-MM-yyyy",[Globalization.CultureInfo]::CreateSpecificCulture('fr-FR'))) } } | Sort Date | Select-Object Directory, Quantity
```


### 4/Compare files

Let two directories IN and OUT. And we want to know if a file with a given name in the directory IN is also in the directory OUT and if their contenta are the same. In order to compare the content, we will use the hash code.




