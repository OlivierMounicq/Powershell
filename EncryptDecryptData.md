

### 1/ Create the key to encrypt the data

Create the key and save it

```ps1
$EncryptionKeyBytes = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($EncryptionKeyBytes)
$EncryptionKeyBytes | Out-File "/Users/mouni/encryption.key"
```

### 2/ Encrypt the file

We want to encrypt the file ```C:\Date\file.txt``` and save the encrypted file ```file.encrypted```

```ps1
$EncryptionKeyData = Get-Content "/Users/mouni/encryption.key"
$file = Get-Content C:\Date\file.txt -Raw
ConvertTo-SecureString $file -AsPlainText -Force | ConvertFrom-SecureString -Key $EncryptionKeyData | Out-File -FilePath '/Users/mouni/file.encrypted'
```

### 3/ Decrypt the encrypted file

```ps1
$EncryptionKeyData = Get-Content "/Users/mouni/encryption.key"
$PasswordSecureString = Get-Content "/Users/mouni/file.encrypted" | ConvertTo-SecureString -Key $EncryptionKeyData
$PlainTextPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PasswordSecureString))
```

And you get the original content.
