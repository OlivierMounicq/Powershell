
## 1/ Get the home path of PS

```ps1
PS C:\Users> $PSHOME
#C:\Program Files\PowerShell\7
```

## 2/ Create a profile
```ps1
PS C:\> New-Item -Path $profile -ItemType File -Force
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

![image](https://user-images.githubusercontent.com/26850726/210091739-20f0f3b7-6e3c-45f0-8844-eba67d95f00c.png)


Next time you open a PS console, the method will be available therefore you can use it !


