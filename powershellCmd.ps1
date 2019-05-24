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

#****************************************************************************************************************************
#1st : Add two lines and update the suffixes
Get-ChildItem -Path D:\GFActivityTester-Conf -include "infra.config" -recurse | %{ (Add-Content -path $_.FullName "`ntestOldService:true`ntestNewService:false"), (Get-Content -LitteralPath $_.FullName | %{ -replace("WORLD.FR","FR.INTRANET") -replace("CIB.FR","FR.INTRANET") }) | Out-File $_.FullName}

#2nd : Update the value 
Get-ChildItem -Path D:\ActivityTester-Conf -include "infra.config" -recurse | %{if(($_.FullName -NotLike "*PRODUCTION*") -and ($_.FullName -NotLike "*COMMO*") {return $_}} | %{ (Get-Content -LiteralPath $_.FullName | %{ $_ -replace ("testNewService:false","testNewService:true") } ) | Out-File $_.FullName }

#3rd : get infra.config content into a single file
Get-ChildItem -Path D:\ActivityTest-Conf -include "infra.config" -recurse | %{ $_.FullName + "`n" + (Get-Content -LiteralPath $_.FullName | Out-String) } >> C:\outputDir\allData.txt

#4 : get the list of the modified files
Get-ChildItem -Path D:\ActivityTester -include "infra.config" -recurse | %{ if(Get-Content -LiteralPath $_.FullName | Out-String) -like "*testNewService:true*"){return º_}} | Select-Object FullName

#5 : get all .cs files with the word mutex (by default, Powershell is insensitive case) and we save the results into a csv file
Get-ChildItem -Path D:\Projet -include "*.cs" -recurse | %{ if( (Get-Content -LiteralPath $_.FullName | Out-string) like "*mutex*"){return $_} } | Select-Object FullName | Export-Csv C:\outputDir\mutex.csv

#6 : Quantity of files containing the word Mutex
Get-ChildItem -Path D:\Projet -include "*.cs" -recurse | %{ if( (Get-Content -LiteralPath $_.FullName | Out-string) like "*mutex*"){return $_} } | Select-Object FullName | Measure-Object | Select-Object Count

#7 : Enumerate the files and savec the properties into a CSV file
Get-Item * | Select-Object DirectoryName, Name, CreationTime | Export-Csv -Path C:\OutputDir\myFile.csv -Delimiter ";"

#8 : Get all projects with GF.Merged.Wrapper
Get-ChildItem "*.csproj" -recurse | %{ if( (Get-Content -LiteralPath $_.FullName | Out-String) -like "*GF.Merged.Wrapper*"){return $_} } | Select-Object FullName

Get-ChildItem "*.csproj" -recurse | %{ if( (Get-Content -LiteralPath $_.FullName | Out-String) -like "*GF.Merged.Wrapper*"){return $_} } | Select-Object FullName | Out-File "D:\outputDir\data.txt"

Get-ChildItem "*.csproj" -recurse | %{ if( (Get-Content -LiteralPath $_.FullName | Out-String) -like "*GF.Merged.Wrapper*"){return $_} } | Select-Object FullName | Export-Csv -Path "D:\outputDir\data.csv"

#***************************************************************************************************************************
#Get the item quantity
Get-ChildItem -recurse | Measure-Object | Select-Object Count

#or
 (Get-ChildItem -recurse | Measure-Object).Count
 
 #Or
 
 




#***************************************************************************************************************************





