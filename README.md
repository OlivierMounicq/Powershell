# Powershell

1/ How to get the version

```ps1
Get-ChildItem Env: | Format-Table -Wrap -AutoSize
```

### File management



#### Merge all file content into a single one

```ps1
 Get-ChildItem -include *.txt -Recurse | %{ $_.Name + ":`n" + (Get-Content -LiteralPath $_.FullName | Out-String)}
```

<p style="background-color:powderblue;">This is a paragraph.</p>


The output:

```html



azerty.txt.txt:
azerty

qwerty.txt.txt:
qwerty

toto.txt:
toto va à la plage

blah.txt:
blah blah blah
```
