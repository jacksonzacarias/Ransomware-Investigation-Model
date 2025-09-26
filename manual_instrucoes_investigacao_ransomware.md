---
```
# ============================================================================== 
# PROJETO:      Manual de Instruções para Investigação de Ransomware
# ============================================================================== 
# Autor: Jackson A Z Savoldi
# Data: 2025-08-26
# LinkedIn: linkedin.com/in/jacksonzacarias
# Instagram: @jacksonsavoldi
# Formacao: Sistemas de Informacao
# Especializacao: Seguranca da Informacao
# ============================================================================== 
```
---





# Manual de Instruções: Investigação de Ransomware
## Guia Prático para Técnicos e Analistas


## Índice

1. [Preparação e Equipamentos](#1-preparação-e-equipamentos)
2. [Procedimentos de Isolamento](#2-procedimentos-de-isolamento)
3. [Coleta de Evidências Físicas](#3-coleta-de-evidências-físicas)
4. [Aquisição de Imagens Forenses](#4-aquisição-de-imagens-forenses)
5. [Análise Estática](#5-análise-estática)
6. [Análise Dinâmica](#6-análise-dinâmica)
7. [Verificação de Integridade](#7-verificação-de-integridade)
8. [Documentação e Relatórios](#8-documentação-e-relatórios)
9. [Checklists Rápidos](#9-checklists-rápidos)
10. [Recursos e Referências](#10-recursos-e-referências)

---

## 1. Preparação e Equipamentos

### 1.1 Hardware Essencial (Prioridade Alta)

#### Write-Blockers (OBRIGATÓRIO)
- **Tableau T8u** - Para discos SATA/IDE
- **CRU/Wiebetech** - Para USB/NVMe
- **Digital Intelligence Ultrakit** - Kit completo
- **IMPORTANTE:** Use SEMPRE hardware write-blocker para evidências

#### Estações de Trabalho
- **Estação Forense Isolada** - Sem conexão de rede
- **Workstation com Rede Controlada** - Para análises dinâmicas
- **Mídias de Armazenamento Seguras** - HDs externos/RAID com controle de acesso

#### Equipamentos de Documentação
- **Câmera Digital** - Para fotografar equipamentos e estado físico
- **Etiquetas de Identificação** - Para marcar evidências
- **Formulários de Chain of Custody** - SANS ou NIST

### 1.2 Software de Aquisição

#### Para Windows
- **FTK Imager** - Cria imagens raw e E01
- **Autopsy + Sleuth Kit** - Análise forense de disco

#### Para Linux
- **dcfldd** - Cópia bit-for-bit com hash automático
- **ddrescue** - Para discos com setores defeituosos
- **ewfacquire/libewf** - Para criar imagens E01
- **Guymager** - Interface gráfica para aquisição forense

### 1.3 Ferramentas de Análise

#### Análise Estática
- **YARA** - Regras para identificar malware
- **hashdeep/md5sum/sha256sum** - Verificação de integridade
- **VirusTotal/Hybrid Analysis** - Verificação de amostras
- **strings** - Extração de strings de arquivos

#### Análise Dinâmica
- **Volatility/Rekall** - Análise de memória
- **Wireshark/tcpdump** - Captura/análise de rede
- **VMware/VirtualBox** - Para ambiente isolado

#### Recursos de Decriptação
- **No More Ransom Project** - Decryptors públicos gratuitos
- **ID Ransomware** - Identificação de tipo de ransomware

---

## 2. Procedimentos de Isolamento

### 2.1 Isolamento Imediato do Ativo

#### Passo 1: Desconectar da Rede
```bash
# Ações físicas:
1. Desligar cabo de rede (Ethernet)
2. Desabilitar Wi-Fi no sistema
3. Desabilitar interfaces de rede (NICs)
4. Registrar data/hora exata do isolamento
```

#### Passo 2: Documentar Estado Inicial
- **Fotografar** o equipamento e cabos conectados
- **Anotar** serial, modelo e número de série
- **Registrar** data/hora do isolamento
- **Identificar** usuário logado (se possível)

### 2.2 Remoção Segura do Disco

#### Passo 1: Preparação
- **Fotografar** o equipamento antes da remoção
- **Anotar** modelo, serial e porta de conexão
- **Preencher** formulário Chain of Custody (SANS/NIST)

#### Passo 2: Remoção
- **Desligar** o equipamento completamente
- **Remover** o disco com cuidado
- **Etiquetar** o disco com ID único
- **Armazenar** em local seguro

---

## 3. Coleta de Evidências Físicas

### 3.1 Documentação Fotográfica

#### O que Fotografar:
- [ ] **Equipamento completo** (frente, trás, laterais)
- [ ] **Conexões de rede** (cabos conectados)
- [ ] **Estado da tela** (se ligado)
- [ ] **Serial numbers** e etiquetas
- [ ] **Ambiente** onde foi encontrado
- [ ] **Write-blocker** conectado

### 3.2 Formulário Chain of Custody

#### Informações Obrigatórias:
- **ID da Evidência:** EVD-[YYYY]-[###]
- **Data/Hora da Coleta:** [DD/MM/AAAA HH:MM:SS]
- **Responsável pela Coleta:** [Nome completo]
- **Local da Coleta:** [Endereço completo]
- **Descrição do Item:** [Detalhes do equipamento]
- **Condição:** [Estado físico observado]

---

## 4. Aquisição de Imagens Forenses

### 4.1 Preparação da Estação Forense

#### Configuração Inicial:
```bash
# 1. Conectar write-blocker
# 2. Conectar disco ao write-blocker
# 3. Verificar LEDs do write-blocker
# 4. Verificar logs do write-blocker
# 5. Identificar dispositivo: lsblk ou fdisk -l
```

### 4.2 Criação de Imagem Forense

#### Opção 1: Imagem Raw (dcfldd)
```bash
# Comando básico:
dcfldd if=/dev/sdX of=/mnt/forensics/image.dd hash=sha256 log=dcfldd.log

# Exemplo completo:
dcfldd if=/dev/sdb of=/mnt/forensics/caso123_disk1.dd \
    hash=sha256 \
    hashlog=/mnt/forensics/caso123_disk1.sha256 \
    log=/mnt/forensics/caso123_disk1.log \
    statusinterval=1000000
```

#### Opção 2: Imagem E01 (ewfacquire)
```bash
# Comando básico:
ewfacquire -u -t "Caso123" -c 4096 /dev/sdX /mnt/forensic/image.E01

# Exemplo completo:
ewfacquire -u \
    -t "Caso123-Disk1" \
    -c 4096 \
    -e "Analista: João Silva" \
    -E "Investigação Ransomware" \
    /dev/sdb \
    /mnt/forensics/caso123_disk1.E01
```

#### Opção 3: Disco com Setores Defeituosos (ddrescue)
```bash
# Para discos danificados:
ddrescue -v /dev/sdX /mnt/forensic/image.dd /mnt/forensic/image.log

# Com retry em áreas problemáticas:
ddrescue -v -r3 /dev/sdX /mnt/forensic/image.dd /mnt/forensic/image.log
```

### 4.3 Verificação de Integridade

#### Cálculo de Hash:
```bash
# Hash do dispositivo original (se possível):
sha256sum /dev/sdX > original.sha256

# Hash da imagem criada:
sha256sum /mnt/forensics/image.dd > image.sha256

# Verificação:
diff original.sha256 image.sha256
```

---

## 5. Análise Estática

### 5.1 Análise com YARA

#### Preparação de Regras:
```bash
# Baixar regras YARA atualizadas:
wget https://github.com/Yara-Rules/rules/archive/master.zip
unzip master.zip

# Executar análise:
yara -r rules-master/malware/ /mnt/forensics/image.dd > yara_results.txt
```

### 5.2 Extração de Strings

#### Busca por Termos Relacionados a Ransomware:
```bash
# Extrair strings e filtrar:
strings /mnt/forensics/image.dd | grep -i ransom > ransom_strings.txt
strings /mnt/forensics/image.dd | grep -i encrypt > encrypt_strings.txt
strings /mnt/forensics/image.dd | grep -i decrypt > decrypt_strings.txt
```

### 5.3 Análise com Sleuth Kit

#### Comandos Básicos:
```bash
# Listar arquivos:
fls -r /mnt/forensics/image.dd > file_list.txt

# Extrair arquivo específico:
icat /mnt/forensics/image.dd [inode] > extracted_file

# Análise de timeline:
mactime -b /mnt/forensics/image.dd > timeline.txt
```

### 5.4 Verificação em Bancos de Dados

#### VirusTotal:
- Upload de arquivos suspeitos
- Verificação de hashes
- Análise de comportamento

#### Hybrid Analysis:
- Análise de malware
- Relatórios detalhados
- IOCs (Indicators of Compromise)

---

## 6. Análise Dinâmica

### 6.1 Configuração de VM Isolada

#### Preparação do Ambiente:
```bash
# 1. Criar VM sem bridge com host
# 2. Configurar rede NAT ou isolada
# 3. Criar snapshot antes da execução
# 4. Configurar captura de tráfego
```

#### Configuração de Captura:
```bash
# Capturar tráfego de rede:
tcpdump -i any -w /mnt/analysis/network_capture.pcap

# Ou com Wireshark:
wireshark -i any -k
```

### 6.2 Execução Segura

#### Procedimentos:
1. **Ativar snapshot** da VM
2. **Executar** arquivo suspeito
3. **Monitorar** comportamento
4. **Capturar** tráfego de rede
5. **Documentar** todas as atividades
6. **Reverter** snapshot após análise

#### IMPORTANTE:
- **NUNCA** dar acesso a recursos reais
- **NUNCA** conectar a backups ou servidores de produção
- **SEMPRE** isolar resultados em storage separado

---

## 7. Verificação de Integridade

### 7.1 Criação de Cópias Verificadas

#### Processo de Cópia:
```bash
# Criar cópia:
cp image.dd /mnt/storage/image_copy1.dd

# Calcular hash da cópia:
sha256sum image_copy1.dd > copy1.sha256

# Verificar integridade:
sha256sum -c copy1.sha256
```

### 7.2 Controle de Cadeia de Custódia

#### Registro de Acessos:
| Data/Hora | Responsável | Ação | Hash Verificado | Status |
|-----------|-------------|------|-----------------|--------|
| [DD/MM/AAAA HH:MM] | [Nome] | [Ação] | [SHA256] | [OK/Erro] |

---

## 8. Documentação e Relatórios

### 8.1 Relatório Técnico

#### Estrutura Obrigatória:
1. **Resumo Executivo**
2. **Descrição do Dispositivo**
3. **Fotografias** (anexadas)
4. **Cópia dos Hashes** (SHA-256/SHA-512)
5. **Logs da Aquisição**
6. **Passo a Passo dos Testes**
7. **Resultados da Análise**
8. **Recomendações**

### 8.2 Preservação de Evidências

#### Armazenamento Seguro:
- **Local físico** com controle de acesso
- **Criptografia** dos arquivos sensíveis
- **Backup** em local separado
- **Controle de temperatura** e umidade

---

## 9. Checklists Rápidos

### 9.1 Checklist de Aquisição (Mini)

- [ ] **Isolar ativo** (desconectar rede)
- [ ] **Fotografar** e anotar serial/modelo
- [ ] **Preencher** Chain of Custody (SANS/NIST)
- [ ] **Conectar** via write-blocker (Tableau/CRU)
- [ ] **Criar imagem** (dcfldd / ewfacquire / ddrescue)
- [ ] **Calcular** SHA-256/SHA-512 e salvar logs
- [ ] **Fazer cópias** verificadas e documentar

### 9.2 Checklist de Análise Dinâmica (Mini)

- [ ] **Usar VM** isolada com snapshot
- [ ] **Rede controlada** / sem acesso a produção
- [ ] **Capturar tráfego** (tcpdump/Wireshark)
- [ ] **Reverter snapshot** após execução
- [ ] **Documentar** todos os resultados
- [ ] **Isolar** artefatos gerados

### 9.3 Checklist de Verificação de Integridade

- [ ] **Hash original** calculado e documentado
- [ ] **Hash da imagem** calculado e verificado
- [ ] **Cópias verificadas** com hash próprio
- [ ] **Logs preservados** e assinados
- [ ] **Chain of Custody** atualizado
- [ ] **Backup seguro** criado

---

## 10. Recursos e Referências

### 10.1 Templates Oficiais

#### Chain of Custody:
- **SANS Institute** - Formulário PDF pronto para uso
- **NIST** - Template DOCX oficial
- **ISO 27037** - Padrão internacional

### 10.2 Ferramentas Recomendadas

#### Hardware:
- **Tableau** - Write-blockers profissionais
- **CRU/Wiebetech** - Equipamentos forenses
- **Digital Intelligence** - Kits completos

#### Software:
- **FTK Imager** - Aquisição Windows
- **Autopsy** - Análise forense
- **Volatility** - Análise de memória
- **YARA** - Detecção de malware

### 10.3 Recursos Online

#### Decriptação:
- **No More Ransom** - Decryptors gratuitos
- **ID Ransomware** - Identificação de tipo

#### Análise:
- **VirusTotal** - Verificação de amostras
- **Hybrid Analysis** - Análise comportamental

### 10.4 Documentação Oficial

- **NIST SP 800-86** - Guia oficial de técnicas forenses
- **ISO 27037** - Diretrizes para evidências digitais
- **SANS** - Recursos de treinamento forense

---

## Avisos Importantes

### ⚠️ **ATENÇÃO:**
- **SEMPRE** use write-blocker para evidências
- **NUNCA** execute malware em ambiente de produção
- **SEMPRE** documente todas as ações realizadas
- **NUNCA** modifique evidências originais
- **SEMPRE** mantenha cadeia de custódia

### 📋 **LEMBRE-SE:**
- Este manual é um guia prático
- Adapte os procedimentos à sua organização
- Mantenha-se atualizado com novas técnicas
- Treine regularmente com exercícios simulados

---

**Manual versão:** 1.0  
**Criado em:** [DD/MM/AAAA]  
**Próxima Revisão:** [DD/MM/AAAA]  
**Classificação:** CONFIDENCIAL  
**Baseado em:** ISO 27037, NIST SP 800-86, ABNT NBR ISO/IEC 27001
