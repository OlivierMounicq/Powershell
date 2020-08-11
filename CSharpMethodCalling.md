## Call a C# module from PowerShell  

#### 1/ Create a new C\# dll

Open VS Code and create a new class library project

```ps1
dotnet new classlib -o StringPatternFinder
```

Rename the file _Class1.cs_ by _PatternRetriever.cs_

```cs
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace StringPatternFinder
{
    public class PatternRetriever 
    {
        public static IEnumerable<string> GetTableName(string fileName, string pattern)
            => File.Exists(fileName) ? 
                    File
                        .ReadAllLines(fileName)
                        .Any(t => Regex.Match(t, pattern, RegexOptions.IgnoreCase).Success) ?
                            File
                                .ReadAllLines(fileName)
                                .Where(t => Regex.Match(t, pattern, RegexOptions.IgnoreCase).Success)
                                .SelectMany(r => Regex.Matches(r, pattern, RegexOptions.IgnoreCase).Cast<Match>().Select(t => t.Groups[0].Value))    
                                .Select(r => r.Split('.'))
                                .Where(arr => arr.Length > 2)
                                .Select(arr => arr[2])
                                .Select(r => r.Replace("[",string.Empty).Replace("]",string.Empty).Trim().ToUpper()) 
                                .Distinct()
                                .OrderBy(t => t)
                            :
                            Enumerable.Empty<string>()
                        :
                        Enumerable.Empty<string>();

        public static string GetFileName(string fullName)                
            => Path.GetFileName(fullName);
    }
}
```

#### 2/The class library using

Once the project built, you must register temporary the new type :

```ps1
Add-Type -Path .\StringPatternFinder.dll
```
And to verify that this new type has been loaded:

```ps1
C:\> [StringPatternFinder.PatternRetriever]
IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     False    PatternRetriever                         System.Object
```

And the you can call the module from PowerShell :

```ps1
 Get-ChildItem | Select-string -pattern "newco" | %{ return $_.Path } | Get-Unique | %{ return new-object psobject -Property @{ StoredProcedure = [StringPatternFinder.PatternRetriever]::GetFileName($_); UsedTables =  [StringPatternFinder.PatternRetriever]::GetTableName($_, "(\[{0,1}Newco)(.*?)\s")} }
```

Anb we get:

```console
StoredProcedure                                                       UsedTables
---------------                                                       ----------

dbo.GetDetailHistoriqueValorisationByCGPAndClient.StoredProcedure.sql {CGP, COMPTE, COMPTEDETAIL, ENVELOPE...}
dbo.GetHistoriqueValorisationByCGPAndClient.StoredProcedure.sql       {CGP, COMPTE, COMPTEDETAIL, ENVELOPE...}
...
```


