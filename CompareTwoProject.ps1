#Purpose : compare two .net project. 
#You compare the cs, cshtml, config, css, js files
#You exclude the contnent of the obj and bin folders

$refRootPath = "E:\Temp\Project1"
$rootPath = "E:\Temp\Project2"

Get-ChildItem  $refRootPath -File -Recurse  | Where { $_.extension -in ".cs",".cshtml",".config",".css",".js" } | Select-Object FullName | %{ if( !(( $_ -like "*\obj\*") -Or ( $_ -like "*\bin\*"))  ){ return $_;} } | %{ return [pscustomobject] @{ReferenceSrc = $_.FullName; Src = $_.FullName.replace($refRootPath,$rootPath) }; } | %{ return [pscustomobject] @{ ReferenceSrc = $_.ReferenceSrc; Src = $_.Src; IsFileExisting =  [System.IO.File]::Exists($_.Src) } } | %{ if($_.IsFileExisting){ return [pscustomobject] @{ ReferenceSrc = $_.ReferenceSrc; Src = $_.Src; AreEqual = ((Get-FileHash $_.ReferenceSrc).Hash -eq (Get-FileHash $_.Src).Hash)}} else{ return [pscustomobject] @{ ReferenceSrc = $_.ReferenceSrc; Src = "NOT EXIST"; AreEqual = "FALSE" } } } | Export-Csv -delimiter "," -Path E:\Temp\Compare-Proj.csv
