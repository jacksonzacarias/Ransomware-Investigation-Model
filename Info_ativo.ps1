# =================== INVENTÁRIO DE ATIVO ===================
# Executar como Administrador
# Salva inventário em TXT + exibe no terminal

$hostname = $env:COMPUTERNAME
$datahora = Get-Date -Format "yyyyMMdd_HHmmss"
$arquivo = ".\inventario_${hostname}_$datahora.txt"

Start-Transcript -Path $arquivo -Force

Write-Output "===================== INVENTÁRIO DO ATIVO - $hostname - $(Get-Date) ====================="

### 2.1 Hardware
Write-Output "`n### 2.1 Hardware"

# CPU
$cpu = Get-CimInstance Win32_Processor
Write-Output ("**Processador:** {0} | Cores: {1} | Threads: {2} | Velocidade Máx: {3} MHz" -f `
    $cpu.Name, $cpu.NumberOfCores, $cpu.NumberOfLogicalProcessors, $cpu.MaxClockSpeed)

# RAM
$ramTotal = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB
Write-Output ("**Memória RAM:** Total: {0:N2} GB" -f $ramTotal)
Get-CimInstance Win32_PhysicalMemory | ForEach-Object {
    Write-Output ("  - Banco:{0} | Tamanho:{1:N2} GB | Tipo:{2} | Velocidade:{3} MHz" -f `
        $_.BankLabel, ($_.Capacity/1GB), $_.MemoryType, $_.Speed)
}

# Discos
Write-Output "`n**Armazenamento (Discos):**"
Get-CimInstance Win32_DiskDrive | ForEach-Object {
    Write-Output ("  - {0} | Modelo:{1} | Tamanho:{2:N2} GB" -f $_.DeviceID, $_.Model, ($_.Size/1GB))
}

# Volumes
Write-Output "`n**Volumes/Partições:**"
Get-CimInstance Win32_Volume | Where-Object { $_.Capacity -gt 0 } | ForEach-Object {
    Write-Output ("  - {0} | Rótulo:{1} | Tamanho:{2:N2} GB | Livre:{3:N2} GB" -f `
        $_.DriveLetter, $_.Label, ($_.Capacity/1GB), ($_.FreeSpace/1GB))
}

# Placas de rede
Write-Output "`n**Placas de Rede:**"
Get-CimInstance Win32_NetworkAdapter | Where-Object { $_.NetEnabled -eq $true } | ForEach-Object {
    Write-Output ("  - Nome:{0} | MAC:{1} | Velocidade:{2} | Status:{3}" -f $_.Name, $_.MACAddress, $_.Speed, $_.NetConnectionStatus)
}

# Placa gráfica
Write-Output "`n**Placa Gráfica:**"
Get-CimInstance Win32_VideoController | ForEach-Object {
    Write-Output ("  - {0} | Driver:{1} | Status:{2}" -f $_.Name, $_.DriverVersion, $_.Status)
}

# BIOS/Placa-mãe
Write-Output "`n**BIOS / Placa-mãe:**"
$bios = Get-CimInstance Win32_BIOS
$board = Get-CimInstance Win32_BaseBoard
Write-Output ("  - BIOS: {0} | Versão:{1} | Data:{2}" -f $bios.Manufacturer, $bios.SMBIOSBIOSVersion, $bios.ReleaseDate)
Write-Output ("  - Placa-mãe: {0} | Modelo:{1}" -f $board.Manufacturer, $board.Product)

# Periféricos
Write-Output "`n**Periféricos Conectados (PnP/USB):**"
Get-PnpDevice | Where-Object { $_.Class -in "Mouse","Keyboard","USB","Monitor","Printer" } | ForEach-Object {
    Write-Output ("  - {0} | Status:{1}" -f $_.FriendlyName, $_.Status)
}

### 2.2 Software
Write-Output "`n### 2.2 Software"

# Sistema Operacional
$so = Get-CimInstance Win32_OperatingSystem
Write-Output ("**Sistema Operacional:** {0} | Versão:{1} | Build:{2}" -f $so.Caption, $so.Version, $so.BuildNumber)
Write-Output ("**Arquitetura:** {0}" -f $so.OSArchitecture)

# Softwares instalados
Write-Output "`n**Softwares Instalados:**"
$softwares = @()
$paths = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*","HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
foreach ($p in $paths) {
    $softwares += Get-ItemProperty $p -ErrorAction SilentlyContinue | Select-Object DisplayName, DisplayVersion
}
if ($softwares) {
    $softwares | Where-Object { $_.DisplayName } | Sort-Object DisplayName | ForEach-Object {
        Write-Output ("  - {0} {1}" -f $_.DisplayName, $_.DisplayVersion)
    }
} else {
    Write-Output "  Nenhum software encontrado (ou sem permissão)."
}

# Segurança
Write-Output "`n**Software de Segurança:**"
Try {
    Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct -ErrorAction Stop | ForEach-Object {
        Write-Output ("  - Antivírus: {0}" -f $_.displayName)
    }
} Catch {
    Write-Output "  Nenhum antivírus detectado (ou acesso negado)."
}
Get-NetFirewallProfile | ForEach-Object {
    Write-Output ("  - Firewall {0}: Enabled={1}" -f $_.Name, $_.Enabled)
}

# Atualizações
Write-Output "`n**Últimas Atualizações / Patches:**"
$hotfixes = Get-HotFix | Sort-Object InstalledOn -Descending
if ($hotfixes) {
    $last = $hotfixes | Select-Object -First 5
    foreach ($h in $last) {
        Write-Output ("  - {0} | {1}" -f $h.HotFixID, ($h.InstalledOn.ToString("dd/MM/yyyy")))
    }
} else {
    Write-Output "  Nenhum hotfix encontrado."
}

### 2.3 Rede
Write-Output "`n### 2.3 Configuração de Rede"

$net = Get-NetIPConfiguration | Where-Object { $_.IPv4Address }
foreach ($n in $net) {
    Write-Output ("Interface: {0}" -f $n.InterfaceAlias)
    Write-Output ("  - IP: {0}" -f $n.IPv4Address.IPAddress)
    Write-Output ("  - MAC: {0}" -f $n.NetAdapter.MacAddress)
    Write-Output ("  - Gateway: {0}" -f $n.IPv4DefaultGateway.NextHop)
    Write-Output ("  - DNS: {0}" -f ($n.DNSServer.ServerAddresses -join ", "))
}

Write-Output "===================== FIM DO INVENTÁRIO ====================="

Stop-Transcript
