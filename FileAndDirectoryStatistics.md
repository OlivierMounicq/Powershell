

### 1/Get the global file quantity in a directory

Let a directory with sub-folders, we want to get the global quantity of files:

```ps1
PS C:> Get-ChildItem MyDirectory -File -Recurse | Measure-Object
```

### 2/Get the file quantity per sub-directory

```ps1
PS C:> Get-ChildItem -Directory | %{ return [pscustomobject] @{ Directory = $_.Name; Quantity = (Get-ChildItem * -Path $_.FullName).Count } }   
```

### 3/Get the file quantity per sub-directory and the order the output

Lets imagine that in the directory _MyDirectory_, the folder name pattern is like dd-MM-yyyy (french date format) and we want to be able to sort by date the sub-folders. So we have to extract the date from the folder's name :

```ps1
PS C:\> Get-ChildItem MyDirectory -Directory | %{ return [pscustomobject] @{ Directory = $_.Name; Quantity = (Get-ChildItem * -Path $_.FullName).Count ; Date = ([datetime]::ParseExact($_.Name,"dd-MM-yyyy",[Globalization.CultureInfo]::CreateSpecificCulture('fr-FR'))) } } | Sort Date | Select-Object Directory, Quantity
```

### 4/Compare two directories

We want to get all files only in the directory IN and not in the directory OUT. We use the name of the file to get the outcome.

```ps1
PS C:\> Get-ChildItem IN -File -Recurse | %{ return [pscustomobject] @{ InputFile = $_.FullName; Name = $_.Name; Directory = $_.Directory; IsFileExist = [System.IO.File]::Exists(("E:\Date\2020.09.01\OUT\" + $_.Name)) } } | %{ if(!$_.IsFileExist){return $_; } } | Select-Object InputFile
```


### 5/Compare the content file

Let two directories IN and OUT. And we want to know if a file with a given name in the directory IN is also in the directory OUT and if their contents are note the same. In order to compare the content, we will use the hash code.

```ps1
PS C:\> Get-ChildItem IN -File -Recurse | %{ return [pscustomobject] @{ InputFile = $_.FullName; Name = $_.Name; Directory = $_.Directory; OutputFile = ("E:\Date\2020.09.01\OUT\" + $_.Name); IsFileExist = [System.IO.File]::Exists(("E:\Date\2020.09.01\OUT\" + $_.Name)) } } | %{ if($_.IsFileExist){return $_; } } | %{ return [pscustomobject] @{ InputFile = $_.InputFile; OutputFile = $_.OutputFile;  IsSameFile = ((Get-FileHash $_.InputFile).Hash -eq (Get-FileHash $_.OutputFile).Hash)  } } | %{ if(!$_.IsSameFile){ return $_;} }
```


