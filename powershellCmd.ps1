#Environment variable
Get-ChildItem Env: | Format-Table -Wrap -Autosize

#==============================================================================================================
#SOME TEST

Get-ChildItem -include "infra.config" -recurse | select-object FullName

Get-ChildItem -include "infra.config" -recurse | %{Add-Content -path $_.FullName "`nthe end`nto"}

Get-ChildItem -Path ".\dir1" -include "infra.config" -recurse | %{Add-Content -path $_.FullName "`nthe end`nto"}

Get-ChildItem -include "infra.config" -recurse | %{Get-Content $_}

#***************************************************************************************************************************
#Pad Left
for($i=0; $i -le 10; $i++){ ([string]$i).PadLeft(3,"0")  }

#001
#002
#003
#004
#005
#006
#007
#008
#009
#010

#***************************************************************************************************************************

$url = "github.com/OlivierMounicq/files/TAG.txt"
for($i=0; $i -le 10; $i++){ $url -Replace ("TAG", ([string]$i).PadLeft(3,"0"))}

#The output
#github.com/OlivierMounicq/files/000.txt
#github.com/OlivierMounicq/files/001.txt
#github.com/OlivierMounicq/files/002.txt
#github.com/OlivierMounicq/files/003.txt
#github.com/OlivierMounicq/files/004.txt
#github.com/OlivierMounicq/files/005.txt
#github.com/OlivierMounicq/files/006.txt
#github.com/OlivierMounicq/files/007.txt
#github.com/OlivierMounicq/files/008.txt
#github.com/OlivierMounicq/files/009.txt
#github.com/OlivierMounicq/files/010.txt

#***************************************************************************************************************************

$url = "github.com/OlivierMounicq/files/[TAG].txt"
for($i=0; $i -le 10; $i++){ $url -Replace ("\[TAG\]", ([string]$i).PadLeft(3,"0"))}

#The output
#github.com/OlivierMounicq/files/000.txt
#github.com/OlivierMounicq/files/001.txt
#github.com/OlivierMounicq/files/002.txt
#github.com/OlivierMounicq/files/003.txt
#github.com/OlivierMounicq/files/004.txt
#github.com/OlivierMounicq/files/005.txt
#github.com/OlivierMounicq/files/006.txt
#github.com/OlivierMounicq/files/007.txt
#github.com/OlivierMounicq/files/008.txt
#github.com/OlivierMounicq/files/009.txt
#github.com/OlivierMounicq/files/010.txt

#***************************************************************************************************************************
#Exclude the files for which the path contains PRODUCTION 
Get-ChildItem -Path C:\mydir\subdir\subsubdir -include "*.txt" -recurse | %{ if($_.FullName -NotLike "*PRODUCTION*") {return $_}} |Select-Object FullName

#Exclude the files for which the path contains PRODUCTION  and COMMO
Get-ChildItem -Path C:\mydir\subdir\subsubdir -include "*.txt" -recurse | %{ if(($_.FullName -NotLike "*PRODUCTION*") -and ($_.FullName -NotLike "*COMMO*")) {return $_}} |Select-Object FullName








