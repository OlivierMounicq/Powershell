# 1/Get the global file quantity in the directory and sub-folders
Get-ChildItem MyDirectory -File -Recurse | Measure-Object

# 2/Get the file quantity per sub-directory
Get-ChildItem -Directory | %{ return [pscustomobject] @{ Directory = $_.Name; Quantity = (Get-ChildItem * -Path $_.FullName).Count } } 

# 3/Get the file quantity per sub-directory and the order the output
Get-ChildItem MyDirectory -Directory | %{ return [pscustomobject] @{ Directory = $_.Name; Quantity = (Get-ChildItem * -Path $_.FullName).Count ; Date = ([datetime]::ParseExact($_.Name,"dd-MM-yyyy",[Globalization.CultureInfo]::CreateSpecificCulture('fr-FR'))) } } | Sort Date | Select-Object Directory, Quantity

# 4/Compare two directories
Get-ChildItem IN -File -Recurse | %{ return [pscustomobject] @{ InputFile = $_.FullName; Name = $_.Name; Directory = $_.Directory; IsFileExist = [System.IO.File]::Exists(("E:\Date\2020.09.01\OUT\" + $_.Name)) } } | %{ if(!$_.IsFileExist){return $_; } } | Select-Object InputFile

#5 / Compare the content file
Get-ChildItem IN -File -Recurse | %{ return [pscustomobject] @{ InputFile = $_.FullName; Name = $_.Name; Directory = $_.Directory; OutputFile = ("E:\Date\2020.09.01\OUT\" + $_.Name); IsFileExist = [System.IO.File]::Exists(("E:\Date\2020.09.01\OUT\" + $_.Name)) } } | %{ if($_.IsFileExist){return $_; } } | %{ return [pscustomobject] @{ InputFile = $_.InputFile; OutputFile = $_.OutputFile;  IsSameFile = ((Get-FileHash $_.InputFile).Hash -eq (Get-FileHash $_.OutputFile).Hash)  } } | %{ if(!$_.IsSameFile){ return $_;} }

