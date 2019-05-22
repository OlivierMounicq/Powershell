#Environment variable
Get-ChildItem Env: | Format-Table -Wrap -Autosize

#==============================================================================================================
#SOME TEST

Get-ChildItem -include "infra.config" -recurse | select-object FullName

Get-ChildItem -include "infra.config" -recurse | %{Add-Content -path $_.FullName "`nthe end`nto"}

