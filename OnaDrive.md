
Para administração de larga escala, muitos ambientes usam a instalação **per-machine** via `OneDriveSetup.exe /allusers`[^1] (documentado pela Microsoft).

---
## Tipos de instalação 

**Instalação por usuário (padrão “per-user”)**

`C:\Users\<nome_do_usuário>\AppData\Local\Microsoft\OneDrive\OneDrive.exe`

**Instalação por máquina (opção /allusers — “per-machine”)**

`C:\Program Files\Microsoft OneDrive\OneDrive.exe`

**Sistemas 32/compatibilidade:**
`C:\Program Files (x86)\Microsoft OneDrive\OneDrive.exe`


> [!obs] Windows Server 
> ** Windows Server 2019 e anteriores Não traz necessariamente o cliente OneDrive pré-ativado** como em desktops;

---
## Risco

`OneDrive.exe` encontrado nesses caminhos (ex.: `C:\Temp`, `C:\Users\Public`, etc.) deve ser investigado.





## Comandos

```
#procura em caminhos legitimos.

$paths = @(

"$env:LOCALAPPDATA\Microsoft\OneDrive\OneDrive.exe",

"C:\Users\*\AppData\Local\Microsoft\OneDrive\OneDrive.exe",

"C:\Program Files\Microsoft OneDrive\OneDrive.exe",

"C:\Program Files (x86)\Microsoft OneDrive\OneDrive.exe"

)

foreach($p in $paths){

Get-ChildItem -Path $p -ErrorAction SilentlyContinue | Select-Object FullName,LastWriteTime,Length

}
# verifica a assinatura na microsft
Get-AuthenticodeSignature "C:\Program Files\Microsoft OneDrive\OneDrive.exe" | Format-List *
```



[^1]: https://learn.microsoft.com/en-us/sharepoint/per-machine-installation?utm_source=chatgpt.com