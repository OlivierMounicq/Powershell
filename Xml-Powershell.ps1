#The goal : there are in the directory a set of csproj files, and we want to extract the value of the HintPath node
#
#

Get-ChildItem -include *.csproj -recurse | %{ $NewStandaloneXml = New-Object -TypeName "System.XML.XmlDocument" ; $NewStandaloneXml.Load($_); $Namespace = New-Object -TypeName "Xml.XmlNamespaceManager" -ArgumentList $NewStandaloneXML.NameTable; $Namespace.AddNamespace("ns", $NewStandaloneXML.DocumentElement.NamespaceURI); return  $NewStandaloneXML.SelectNodes("//ns:HintPath/text()", $Namespace)} | %{ return new-object psobject -property @{FileName = $_.BaseURI; BinaryFilePath = $_.OuterXml }}

