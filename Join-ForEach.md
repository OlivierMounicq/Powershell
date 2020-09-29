## Inner Join by using the ForEach

Let two lists :

```ps1
PS C:\ > $writers = ([pscustomobject] @{ Id = 1; FullName = "Victor Hugo"; IdCity = 1 }, [pscustomobject] @{ Id = 2; FullName = "Jules Verne"; IdCity = 2 }, [pscustomobject] @{ Id = 3; FullName = "Honore Balzac"; IdCity = 1 })
PS C:\ > $cities = ([pscustomobject] @{ Id = 1; City = "Paris"}, [pscustomobject] @{ Id = 2; City = "Nantes"})
```

And we want to compute an inner join

```ps1
PS C:\ > ForEach($writer in $writers){ ForEach($city in $cities){ if($writer.IdCity -eq $city.Id){ [pscustomobject] @{ Id = $writer.Id; FullName = $writer.FullName; City = $city.City} } } }
```

And the result is :

```ps1
Id FullName      City
-- --------      ----
 1 Victor Hugo   Paris
 2 Jules Verne   Nantes
 3 Honore Balzac Paris
```
