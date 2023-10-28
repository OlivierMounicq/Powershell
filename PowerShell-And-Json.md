## PowerShell and JSON

Let a input JSON string and we want to extract some data from the json and finally transform the object list into JSON

```ps1
PS C:\>'[ { "Item1" : "Albert", "Item2" : "Einstein" }, { "Item1" : "Richard", "Item2" : "Feynmann" } ]' | ConvertFrom-Json | %{ return $_; }  | %{ return [pscustomobject] @{ FirstName = $_.Item1; LastName = $_.Item2; } } | ConvertTo-Json
```

And the output will be :

```ps1
[
    {
        "FirstName":  "Albert",
        "LastName":  "Einstein"
    },
    {
        "FirstName":  "Richard",
        "LastName":  "Feynmann"
    }
]
```

## Read from a file

Let a json file called ```WorldCupFinal.json```:

```json
[{
  "Team" : "Argentina",
  "Players" : [
    "Martinez",
    "Molina",
    "Romero",
    "Otamendi",
    "Tagliafico",
    "De Paul",
    "Fernandez",
    "Mac Alister",
    "Messi",
    "Alvarez",
    "Di Maria" 
  ]},
{
  "Team" : "France",
  "Players" : [
    "Loris",
    "Hernandez",
    "Upamecano",
    "Varane",
    "Kounde",
    "Rabiot",
    "Tchouameni",
    "Mbappe",
    "Griezmann",
    "Dembele",
    "Giroud"
  ],  
}]
```

And get the french players : 

```ps1
PS C:\> Get-Content .\WorldCupFinal.json | ConvertFrom-Json | Where Team -eq "France" | %{ return $_.Players; }
Loris
Hernandez
Upamecano
Varane
Kounde
Rabiot
Tchouameni
Mbappe
Griezmann
Dembele
Giroud
```

## Other queries

```ps1
PS C:\> (Get-Content .\WorldCupFinal.json | ConvertFrom-Json).Team
Argentina
France
```

```ps1
PS C:\> (Get-Content .\WorldCupFinal.json | ConvertFrom-Json).Players
Martinez
Molina
Romero
Otamendi
Tagliafico
De Paul
Fernandez
Mac Alister
Messi
Alvarez
Di Maria
Loris
Hernandez
Upamecano
Varane
Kounde
Rabiot
Tchouameni
Mbappe
Griezmann
Dembele
Giroud
```

```ps1
PS C:\>(Get-Content .\WorldCupFinal.json | ConvertFrom-Json)[1]
Team   Players
----   -------
France {Loris, Hernandez, Upamecano, Varane…}
```

```ps1
PS C:\> (Get-Content .\WorldCupFinal.json | ConvertFrom-Json)[1].Players
Loris
Hernandez
Upamecano
Varane
Kounde
Rabiot
Tchouameni
Mbappe
Griezmann
Dembele
Giroud
```

## Display like a table

```ps1
Get-Content .\players.json | ConvertFrom-Json | %{ $Team = $_.Team; $_.Players | %{ return [pscustomobject] @{ Team = $Team; Player = $_ } } } | Sort Team, Player
```

```ps1
Team      Player
----      ------
Argentina Alvarez
Argentina De Paul
Argentina Di Maria
Argentina Fernandez
Argentina Mac Alister
Argentina Martinez
Argentina Messi
Argentina Molina
Argentina Otamendi
Argentina Romero
Argentina Tagliafico
France    Dembele
France    Giroud
France    Griezmann
France    Hernandez
France    Kounde
France    Loris
France    Mbappe
France    Rabiot
France    Tchouameni
France    Upamecano
France    Varane
```






