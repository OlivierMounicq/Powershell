## Group-Object

Let an object list : 

```ps1
PS C:\ > $writersList = ([pscustomobject] @{ FullName = "Victor Hugo"; City = "Paris"}, [pscustomobject] @{ FullName = "Jules Verne";  City = "Nantes" }, [pscustomobject] @{ FullName = "Honoré de Balzac"; City = "Paris" } ) 
```

And we want to group by the _City_ the writers : 

```ps1
PS C:\ > $writersList | Group-Object City
Count Name                      Group
----- ----                      -----
    2 Paris                     {@{FullName=Victor Hugo; City=Paris}, @{FullName=Honoré de Balzac; City=Paris}}
    1 Nantes                    {@{FullName=Jules Verne; City=Nantes}}
```

And we want to get a writer list related to the city

```ps1
PS C:\> $writersList | Group-Object City | %{ return [pscustomobject] @{ City = $_.Name; Writers = $_.Group.FullName} }                                                                                                                                                                                                      
City   Writers
----   -------
Paris  {Victor Hugo, Honoré de Balzac}
Nantes Jules Verne
```

