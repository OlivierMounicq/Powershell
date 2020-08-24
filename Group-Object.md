## Group-Object

Let a list of persons : 

Create an empty list : 

```ps1
PS C:> $list = [System.Collections.ArrayList]@()
```

Add the person and the city  

```ps1
PS C:> $list.Add([pscustomobject] @{ Country = "USA"; Person = "Albert Einstein" })
PS C:> $list.Add([pscustomobject] @{ Country = "USA"; Person = "Richard Feynmann" })
PS C:> $list.Add([pscustomobject] @{ Country = "UK"; Person = "Alan Turing" })
PS C:> $list.Add([pscustomobject] @{ Country = "France"; Person = "Raymond Poincaré" })
PS C:> $list.Add([pscustomobject] @{ Country = "France"; Person = "Paul Lévy" })
PS C:> $list.Add([pscustomobject] @{ Country = "France"; Person = "Benoit Mandelbrot" })
```

And we want to group by _Country_  


```ps1
PS C:> $list | Group-Object Country

#Count Name                      Group
#----- ----                      -----
#    2 USA                       {@{Country=USA; Person=Albert Einstein}, @{Country=USA; Person=Richard Feynmann}}
#    1 UK                        {@{Country=UK; Person=Alan Turing}}
#    3 France                    {@{Country=France; Person=Raymond Poincaré}, @{Country=France; Person=Paul Lévy}, @{Country=France; Person=Benoit Mandelbrot}}

```

The output contains three columns:
- Count
- Name : the grouping key value
- Group : the grouped list

As you can notice, the Group contains the object and each object contains the key. It's better when we can extract the person name and filter out the country

But now we want to get a person list by _country_ : 

```ps1
PS C:>  $list | Group-Object Country | Select-Object Name, @{ Expression = { $_.PSObject.Properties.Value.Person -join "; " } }                                                                                                                                                                       
#Name    $_.PSObject.Properties.Value.Person -join "; "
#----   ------------------------------------------------
#USA    Albert Einstein; Richard Feynmann
#UK     Alan Turing
#France Raymond Poincaré; Paul Lévy; Benoit Mandelbrot
```


And we want to rename the header labels :

```ps1

PS C:\> $list | Group-Object Country | Select-Object @{ Expression = {$_.Name}; Label = "Country" }, @{ Expression = { $_.PSObject.Properties.Value.Person -join "; " };  Label = "Persons" }                                                                                                         

#Country Persons
#------- -------
#USA     Albert Einstein; Richard Feynmann
#UK      Alan Turing
#France  Raymond Poincaré; Paul Lévy; Benoit Mandelbrot
```


### The type of the objects

```ps1
PS C:\> $list | Group-Object Country | %{ return $_.PSObject.Properties.Value.Person.GetType() } 

#IsPublic IsSerial Name                                     BaseType
#-------- -------- ----                                     --------
#True     True     Object[]                                 System.Array
#True     True     String                                   System.Object
#True     True     Object[]                                 System.Array

```


