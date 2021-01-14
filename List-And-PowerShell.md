# List and Powershell

### 1/ Find the values in only one list

```ps1
PS E:\> $list1 = (1,2,3,4,5,6,7,8,9,10)
PS E:\> $list2 = (7,8,9,10,11,12,13,14,15)
PS E:\> $list1 | Where { $list2 -notcontains $_}
```

And the result is:

```ps1
1
2
3
4
5
6
```

### 2/ Common value in two lists

```ps1
PS E:\> $list1 = (1,2,3,4,5,6,7,8,9,10)
PS E:\> $list2 = (7,8,9,10,11,12,13,14,15)
PS E:\> $list1 | Where { $list2 -contains $_}
```

And the result is:

```ps1
7
8
9
10
```



### 3/ Compare two directories

```ps1
PS E:\> $bigDir = (Get-ChildItem -Path C:\dir\dir1\*.pdf | %{ return $_.Name })
PS E:\> $smallDir = (Get-ChildItem -Path C:\dir\dir2\*.pdf | %{ return $_.Name })
PS E:\> $bigDir | Where { $smallDir -notcontains $_ }
```



```ps1
PS E:\> $bigDir = (Get-ChildItem -Path C:\dir\dir1\*.pdf | %{ return $_.Name })
PS E:\> $smallDir = (Get-ChildItem -Path C:\dir\dir2\*.pdf | %{ return $_.Name })
PS E:\> $bigDir | Where { $smallDir -contains $_ }
```


