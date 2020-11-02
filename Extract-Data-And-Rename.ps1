# Purpose : we want to extract the date from the CSV file content (1st row and 1st column), use this date to filter out some file and then copy the files to another directory

$StartDate = Get-Date "2020-06-30"
$EndDate = Get-Date "2020-10-01"
$DestinationRepertoire = "E:\Date\2020.11.02\Import\1.Wiseam - CM CIC\T3"
Get-ChildItem * | %{return [pscustomobject] @{File = $_; PositionDate = (((Get-Content $_.FullName -First 1) -split ';')[0] -as [DateTime]) }} | %{ if(($_.PositionDate -gt $StartDate) -and ($_.PositionDate -lt $EndDate)){return $_;}} | %{ Copy-Item $_.File.FullName -Destination $DestinationRepertoire }


