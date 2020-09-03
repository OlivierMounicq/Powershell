#Purpose : compare two .net project. 
#You compare the cs, cshtml, config, css, js files
#You exclude the contnent of the obj and bin folders
Get-ChildItem E:\GitSource\lmep -File -Recurse | Where { $_.extension -in ".cs",".cshtml",".config",".css",".js" } | Select-Object FullName | %{ if( !(( $_ -like "*\obj\*") -Or ( $_ -like "*\bin\*"))  ){ return $_;} } | %{ return [pscustomobject] @{LmepPoc = $_.FullName; GitSrc = $_.FullName.replace("E:\GitSource\lmep","E:\GitSource\UpsiRetro-Out") }; } | %{ return [pscustomobject] @{ LmepPoc = $_.LmepPoc; GitSrc = $_.GitSrc; IsFileExisting =  [System.IO.File]::Exists($_.GitSrc) } } | %{ if($_.IsFileExisting){ return [pscustomobject] @{ LmepPoc = $_.LmepPoc; GitSrc = $_.GitSrc; AreEqual = ((Get-FileHash $_.LmepPoc).Hash -eq (Get-FileHash $_.GitSrc).Hash)}} } | %{ if(! $_.AreEqual){ return $_;} } | Format-Table -Wrap -Autosize



#
