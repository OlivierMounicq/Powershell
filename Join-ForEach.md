## Inner Join by using the ForEach

Let two lists :

```ps1
PS C:\ > $writers = ([pscustomobject] @{ Id = 1; FullName = "Victor Hugo"; IdCity = 1 }, [pscustomobject] @{ Id = 2; FullName = "Jules Verne"; IdCity = 2 }, [pscustomobject] @{ Id = 3; FullName = "Honore Balzac"; IdCity = 1 })
PS C:\ > $cities = ([pscustomobject] @{ Id = 1; City = "Paris"}, [pscustomobject] @{ Id = 1; City = "Paris"})
```

