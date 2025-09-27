

O svchost.exe (Service Host) é um processo legítimo do Windows que funciona como um "container" para executar vários serviços do sistema operacional.
Em vez de cada serviço rodar em seu próprio processo, o Windows agrupa vários deles dentro de instâncias do svchost.exe para economizar recursos.
No Gerenciador de Tarefas, terá vários svchost.exe rodando ao mesmo tempo — cada um deles hospedando serviços diferentes.

Exemplos de serviços hospedados:
- **wuauserv** → Windows Update
- **Dnscache** → Cache de DNS
- **AudioSrv** → Áudio do Windows
- **LanmanServer** → Compartilhamento de arquivos/impressoras


No **Windows Server 2019** ,Windows 10/11 o caminho **legítimo** do executável **`svchost.exe`**
**`C:\Windows\System32\svchost.exe`**


---

Script em PowerShell** que faz tudo por etapas: primeiro lista todas as instâncias de `svchost.exe`, depois extrai informações detalhadas de cada uma, como:

- Data e hora de início
- Usuário que iniciou
- Serviços hospedados
- Modo de inicialização (automático, manual)
- Caminho do executável
- Assinatura digital


 Etapa 1: Listar todos os processos `svchost.exe` com PID, hora de início e usuário

```
$svchosts = Get-WmiObject Win32_Process -Filter "Name = 'svchost.exe'" | ForEach-Object { $owner = $_.GetOwner() [PSCustomObject]@{ Name = $_.Name ProcessId = $_.ProcessId CreationDate = $_.CreationDate User = $owner.User Domain = $owner.Domain Path = $_.ExecutablePath } } $svchosts | Format-Table -AutoSize
```


Etapa 2: Ver serviços hospedados por cada `svchost.exe`
```
$services = Get-CimInstance Win32_Service | Where-Object { $_.ProcessName -eq 'svchost.exe' } $services | Select-Object Name, DisplayName, ProcessId, StartName, StartMode | Format-Table -AutoSize
```


 Etapa 3: Correlacionar serviços com processos
```
foreach ($proc in $svchosts) { Write-Host "`n🔍 ProcessId: $($proc.ProcessId) | User: $($proc.User) | Started: $($proc.CreationDate)" $linkedServices = $services | Where-Object { $_.ProcessId -eq $proc.ProcessId } foreach ($svc in $linkedServices) { Write-Host " ↪ Service: $($svc.DisplayName) | StartMode: $($svc.StartMode) | StartName: $($svc.StartName)" } }
```


 Etapa 4: Verificar assinatura digital do executável
 
```
$svchostPath = "C:\Windows\System32\svchost.exe" Get-AuthenticodeSignature $svchostPath | Format-List
```






Fonte para entender funcionamento do svhost.exe 

MICROSOFT. **Refatoração do serviço Svchost**. Disponível em: [https://learn.microsoft.com/pt-br/windows/application-management/svchost-service-refactoring](https://learn.microsoft.com/pt-br/windows/application-management/svchost-service-refactoring). Acesso em: 26 set. 2025.