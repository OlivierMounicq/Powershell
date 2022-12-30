
## 1/ Get the home path of PS

```ps1
PS C:\Users> $PSHOME
#C:\Program Files\PowerShell\7
```

## 2/ Create a profile
```ps1
	New-Item -Path $profile -ItemType File -Force
```

## 3/ Add method to the PS session

```ps1
PS C:> notepad $profile
```

Then add the methods like this one 

```ps1
function GetVkUrl {
	Param ([string]$url)

	return $url.replace('\','').replace('&amp;','&')
}
```


