#The goal : get all config files, copy them and rename them (new name : the project name (the folder of the project) and -packages.conf)
Get-ChildItem packages.config -recurse | %{ return new-object psobject -property @{Source = $_.FullName; Target = Join-Path E:\Date\2020.06.09\NugetConf (-join((Split-Path(Split-Path  $_.FullName -Parent) -Leaf ), "-packages.config" ))} } | %{ Copy-Item  $_.Source $_.Target}


#The goal : list all nuget packages used by all projects
Get-ChildItem packages.config -recurse | %{ $NewStandaloneXml = New-Object -TypeName "System.XML.XmlDocument" ; $NewStandaloneXml.Load($_); return new-object psobject    @{ Data = $NewStandaloneXml; ProjectName = Split-Path(Split-Path  $_.FullName -Parent) -Leaf }} | %{ foreach($packageNode in $_.Data.SelectNodes("//package")){ $packageNode.SetAttribute("projectName", $_.ProjectName); } return  $_.Data.SelectNodes("//package") } | %{ return new-object psobject -property @{ PackageName = $_.id; Version = $_.version; FrameworkVersion = $_.targetFramework; ProjectName = $_.projectName } } | Select-Object ProjectName, PackageName, Version, FrameworkVersion

#OR

Get-ChildItem packages.config -recurse 
| 
%{ 
  $NewStandaloneXml = New-Object -TypeName "System.XML.XmlDocument" ; 
  $NewStandaloneXml.Load($_); 
  return new-object psobject 
    @{ 
      Data = $NewStandaloneXml; 
      ProjectName = Split-Path(Split-Path  $_.FullName -Parent) -Leaf 
    }
} 
| 
%{ 
  foreach($packageNode in $_.Data.SelectNodes("//package"))
  { 
    $packageNode.SetAttribute("projectName", $_.ProjectName); 
  }
  return  $_.Data.SelectNodes("//package") 
} 
|
%{ 
  return new-object psobject -property 
    @{ 
      PackageName = $_.id; 
      Version = $_.version; 
      FrameworkVersion = $_.targetFramework; 
      ProjectName = $_.projectName 
    } 
} 
| 
Select-Object ProjectName, PackageName, Version, FrameworkVersion

