$list = [System.Collections.ArrayList]@()

$list.Add([pscustomobject] @{ Country = "USA"; Person = [pscustomobject] @{ FirstName = "Albert"; LastName = "Einstein" }})
$list.Add([pscustomobject] @{ Country = "USA"; Person = [pscustomobject] @{ FirstName = "Richard"; LastName = "Feynmann" }})
$list.Add([pscustomobject] @{ Country = "UK"; Person = [pscustomobject] @{ FirstName = "Alan"; LastName = "Turing" }})
$list.Add([pscustomobject] @{ Country = "France"; Person = [pscustomobject] @{ FirstName = "Raymond"; LastName = "Poincaré" }})
$list.Add([pscustomobject] @{ Country = "France"; Person = [pscustomobject] @{ FirstName = "Paul"; LastName = "Lévy" }})
$list.Add([pscustomobject] @{ Country = "France"; Person = [pscustomobject] @{ FirstName = "Benoit"; LastName = "Mandelbrot" }})

$list | Group-Object Country | %{ return [pscustomobject] @{ Country = $_.Name;  Persons =  ([Linq.Enumerable]::Select(([System.Object[]]$_.PSObject.Properties.Value.Person), [Func[Object, String]] { $args[0].LastName}))  } } 
