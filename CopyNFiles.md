### Copy N path in several destination folders

We want to split the file set into different small file set with a given quantity and copy each small set into a specific destination directory. And we want to create the destination directorie.  

For instance, we have 102 files in the _Original_ folder and we want copy the first 5 files into the destination directory _C:\Temp\Destination\1_. And then copy the next 5 files into the _C:\Temp\Destination\2_.


```ps1
PS C:\Temp\Original > $qty = 5
PS C:\Temp\Orignal > 0..([Math]::Floor((Get-ChildItem -File *.txt | Measure-Object).Count / $qty) + 1) | %{ Get-ChildItem -File *.txt | Select-Object -Skip ($_*$qty) -First $qty |Copy-Item  -Destination (mkdir  (('C:\Temp\Destination\', $_) -join''))  }
```
