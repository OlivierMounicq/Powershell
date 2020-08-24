## Group-Object

Let a list of persons : 

Create an empty list : 

```ps1
$list = [System.Collections.ArrayList]@()
```

Add the person and the city  

```ps1
$list.Add([pscustomobject] @{ Country = "USA"; Person = "Albert Einstein" })
$list.Add([pscustomobject] @{ Country = "USA"; Person = "Richard Feynmann" })
$list.Add([pscustomobject] @{ Country = "UK"; Person = "Alan Turing" })
$list.Add([pscustomobject] @{ Country = "France"; Person = "Raymond Poincaré" })
$list.Add([pscustomobject] @{ Country = "France"; Person = "Paul Lévy" })
$list.Add([pscustomobject] @{ Country = "France"; Person = "Benoit Mandelbrot" })
```

And we want to group by _Country_  




