# How to query the EDMX file
# 1st statement
Get-ChildItem .\Model.edmx | %{ $NewStandaloneXml = New-Object -TypeName "System.XML.XmlDocument" ; $NewStandaloneXml.Load($_) }

#2nd statement
$Namespace = New-Object -TypeName "Xml.XmlNamespaceManager" -ArgumentList $NewStandaloneXML.NameTable;

#3rd statement 
$Namespace.AddNamespace("edmx", $NewStandaloneXML.DocumentElement.NamespaceURI);

#4th statement
$Namespace.AddNamespace("ns", "http://schemas.microsoft.com/ado/2009/11/edm/ssdl");

#5th statement
$Namespace.AddNamespace("store", "http://schemas.microsoft.com/ado/2007/12/edm/EntityStoreSchemaGenerator");

#6th statement 
$Namespace.AddNamespace("customannotation", "http://schemas.microsoft.com/ado/2013/11/edm/customannotation");

#7th statement : beware where the file is saved
$NewStandaloneXML.SelectNodes("//ns:EntityType", $Namespace) | %{ $Table = $_.Name; $_.SelectNodes("ns:Property", $Namespace) | %{ return [pscustomobject] @{ Table = $Table; Column = $_.Name; ColumnType = $_.Type } } } | Export-Csv -Path E:\Date\2021.12.22\Edmx-LMEP-RETRO-OUT.csv -Delimiter ";"

# Only one statement
Get-ChildItem .\Model.edmx | %{ $NewStandaloneXml = New-Object -TypeName "System.XML.XmlDocument" ; $NewStandaloneXml.Load($_); $Namespace = New-Object -TypeName "Xml.XmlNamespaceManager" -ArgumentList $NewStandaloneXML.NameTable; $Namespace.AddNamespace("edmx", $NewStandaloneXML.DocumentElement.NamespaceURI); $Namespace.AddNamespace("ns", http://schemas.microsoft.com/ado/2009/11/edm/ssdl); $Namespace.AddNamespace("store", http://schemas.microsoft.com/ado/2007/12/edm/EntityStoreSchemaGenerator); $Namespace.AddNamespace("customannotation", http://schemas.microsoft.com/ado/2013/11/edm/customannotation); $NewStandaloneXML.SelectNodes("//ns:EntityType", $Namespace) | %{ $Table = $_.Name; $_.SelectNodes("ns:Property", $Namespace) | %{ return [pscustomobject] @{ Table = $Table; Column = $_.Name; ColumnType = $_.Type } } }} | Export-Csv -Path E:\Date\2021.12.22\Test.csv -Delimiter ";"
