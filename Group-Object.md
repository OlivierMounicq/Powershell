## Group-Object

### 1/ Initialize the data

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

### 2/ The 1st grouping : a simply grouping

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

As you can notice, the Group contains the object list and each object contains the key. It's better if we can extract the person name and filter out the country

But now we want to get a person list by _country_ : 

### 3/ The 2nd grouping : transform the output

For each country, wa want to associate a person list:

```ps1
PS C:\Date\2020.08.21\Upsideo> $list | Group-Object Country | %{ return [pscustomobject] @{ Country = $_.Name;  Persons =  $_.PSObject.Properties.Value.Person } }

Country Persons
------- -------
USA     {Albert Einstein, Richard Feynmann}
UK      Alan Turing
France  {Raymond Poincaré, Paul Lévy, Benoit Mandelbrot}
```

But as you may notice, the Persons type is not the same : for USA and France, we get an Object[] but for UK we get a string.  
  

```ps1
PS C:\> $list | Group-Object Country | %{ return [pscustomobject] @{ Country = $_.Name;  Persons =  $_.PSObject.Properties.Value.Person.GetType() } }

# Country Persons
# ------- -------
# USA     System.Object[]
# UK      System.String
# France  System.Object[]
```

=> We should normalize the output type

### 4/ The 3rd grouping: transform and normalize the output (Country and person list)

For any country, we associate a person list even if we have only one person for a given country.

```ps1
PS C:\> $list | Group-Object Country | %{ return [pscustomobject] @{ Country = $_.Name;  Persons =  ([System.Object[]]$_.PSObject.Properties.Value.Person) } }  

# Country Persons
# ------- -------
# USA     {Albert Einstein, Richard Feynmann}
# UK      {Alan Turing}
# France  {Raymond Poincaré, Paul Lévy, Benoit Mandelbrot}
```

And now we get a person list for the UK country.


```ps1
PS C:\> $list | Group-Object Country | %{ return [pscustomobject] @{ Country = $_.Name;  Persons =  ([System.Object[]]$_.PSObject.Properties.Value.Person).GetType() } } 

# Country Persons
# ------- -------
# USA     System.Object[]
# UK      System.Object[]
# France  System.Object[]

```

### 5/ The 4th grouping : the LINQ Select using

Now we want to apply the Select operator:

```ps1
PS C:\> $list | Group-Object Country | %{ return [pscustomobject] @{ Country = $_.Name;  Persons =  ([Linq.Enumerable]::Select(([System.Object[]]$_.PSObject.Properties.Value.Person), [Func[Object, String]] { $args[0] }))  } }                                                        

# Country Persons
# ------- -------
# USA     {Albert Einstein, Richard Feynmann}
# UK      {Alan Turing, Isaac Newton}
# France  {Raymond Poincaré, Paul Lévy, Benoit Mandelbrot}
# Italy   {Enrico Fermi}
```

And the proof : 


```ps1
PS C:\>  $list | Group-Object Country | %{ return [pscustomobject] @{ Country = $_.Name;  Persons =  ([Linq.Enumerable]::Select(([System.Object[]]$_.PSObject.Properties.Value.Person), [Func[Object, String]] { $args[0] })).GetType()   } }

# Country Persons
# ------- -------
# USA     System.Linq.Enumerable+WhereSelectArrayIterator`2[System.Object,System.String]
# UK      System.Linq.Enumerable+WhereSelectArrayIterator`2[System.Object,System.String]
# France  System.Linq.Enumerable+WhereSelectArrayIterator`2[System.Object,System.String]
# Italy   System.Linq.Enumerable+WhereSelectArrayIterator`2[System.Object,System.String]
```


### 5/ The 4th grouping : transform a list into a string


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




### 6/ The type of the objects of the output

```ps1
PS C:\> $list | Group-Object Country | %{ return $_.PSObject.Properties.Value.Person.GetType() } 

#IsPublic IsSerial Name                                     BaseType
#-------- -------- ----                                     --------
#True     True     Object[]                                 System.Array
#True     True     String                                   System.Object
#True     True     Object[]                                 System.Array

```



