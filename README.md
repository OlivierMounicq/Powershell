# Powershell

1/ How to get the version

```ps1
Get-ChildItem Env: | Format-Table -Wrap -AutoSize
```

2/ How to merge several file content into a single one

```ps1
 Get-ChildItem -include *.txt -Recurse | %{ $_.Name + ":`n" + (Get-Content -LiteralPath $_.FullName | Out-String)}
```

