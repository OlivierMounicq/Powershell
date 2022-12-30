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

Let a json file called WorldCupFinal.json:

```json
[{
  "Team" : "Argentina",
  "Players" : [
    "Martinez"
    "Molina"
    "Romero"
    "Otamendi"
    "Tagliafico"
    "De Paul"
    "Fernandez"
    "Mac Alister"
    "Messi"
    "Alvarez"
    "Di Maria" 
  ]},
{
  "Team" : "Argentina",
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
