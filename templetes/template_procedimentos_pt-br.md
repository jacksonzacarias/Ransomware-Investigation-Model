# Template: Procedimentos para Investigação de Ransomware
## Guia de Resposta a Incidentes

---

## Metadados do Documento

**ID do Documento:** DOC-PROC-[YYYY]-[###]  
**Data de Criação:** [DD/MM/AAAA HH:MM:SS]  
**Responsável Técnico:** [Nome]  
**Caso Relacionado:** [ID-CASO-YYYY-###]  
**Classificação:** CONFIDENCIAL  
**Versão:** 1.0

---

## 1. Visão Geral dos Procedimentos

### 1.1 Objetivo
Este documento estabelece os procedimentos padronizados para resposta a incidentes de ransomware, incluindo:
- Detecção e confirmação de ataques
- Isolamento e contenção de sistemas afetados
- Análise forense e investigação
- Recuperação e restauração
- Prevenção de futuros ataques

### 1.2 Escopo
- Sistemas suspeitos de infecção por ransomware
- Sistemas já comprometidos e criptografados
- Análise de evidências digitais
- Coordenação com equipes internas e externas
- Documentação e relatórios

### 1.3 Responsabilidades
- **Equipe de Segurança:** Análise e investigação
- **Equipe de TI:** Isolamento e recuperação técnica
- **Gestão:** Aprovações e comunicação
- **Jurídico:** Aspectos legais e regulatórios

---

## 2. Procedimentos de Detecção e Confirmação

### 2.1 Sinais de Alerta
- [ ] **Arquivos com extensões suspeitas** (.locked, .encrypted, .crypto, etc.)
- [ ] **Mensagens de resgate** em telas ou arquivos
- [ ] **Alterações em extensões de arquivos** sem autorização
- [ ] **Atividade de rede anômala** (conexões suspeitas)
- [ ] **Processos desconhecidos** em execução
- [ ] **Logs de sistema corrompidos** ou ausentes
- [ ] **Antivírus desabilitado** ou corrompido
- [ ] **Backups corrompidos** ou inacessíveis

### 2.2 Procedimento de Confirmação
1. **Isolamento Imediato**
   - Desconectar da rede (cabo e Wi-Fi)
   - Não desligar o sistema imediatamente
   - Documentar estado atual

2. **Coleta de Evidências Iniciais**
   - Fotografar tela e mensagens
   - Anotar data/hora do incidente
   - Registrar usuário logado
   - Listar processos em execução

3. **Notificação da Equipe**
   - Acionar equipe de resposta a incidentes
   - Notificar gestão imediatamente
   - Comunicar com equipe jurídica se necessário

---

## 3. Procedimentos de Isolamento e Contenção

### 3.1 Isolamento de Sistemas Afetados
- [ ] **Desconectar da rede** (físico e lógico)
- [ ] **Desabilitar interfaces de rede** no sistema
- [ ] **Isolar em VLAN** separada se necessário
- [ ] **Documentar hora do isolamento**
- [ ] **Notificar equipe de rede**

### 3.2 Contenção de Propagação
- [ ] **Verificar outros sistemas** na mesma rede
- [ ] **Analisar logs de firewall** e IDS/IPS
- [ ] **Verificar backups** por integridade
- [ ] **Isolar sistemas relacionados**
- [ ] **Implementar regras de firewall** temporárias

### 3.3 Preservação de Evidências
- [ ] **Não desligar sistemas** afetados
- [ ] **Criar imagem forense** antes de qualquer ação
- [ ] **Documentar estado** de todos os sistemas
- [ ] **Preservar logs** de sistema e rede
- [ ] **Manter cadeia de custódia**

---

## 4. Procedimentos de Análise Forense

### 4.1 Coleta de Evidências
1. **Preparação do Ambiente**
   - Configurar estação forense isolada
   - Verificar ferramentas forenses
   - Preparar mídias de armazenamento

2. **Criação de Imagem Forense**
   ```bash
   # Exemplo de comando para imagem forense
   dcfldd if=/dev/sdX of=/mnt/forensics/image.dd hash=sha256 log=dcfldd.log
   ```

3. **Verificação de Integridade**
   - Calcular hash SHA-256 da imagem
   - Comparar com hash do dispositivo original
   - Documentar todos os hashes

### 4.2 Análise de Malware
1. **Análise Estática**
   - Executar antivírus atualizado
   - Análise com YARA rules
   - Verificação de hashes em bancos de dados
   - Análise de strings e metadados

2. **Análise Dinâmica** (em ambiente controlado)
   - Executar em VM isolada
   - Capturar tráfego de rede
   - Monitorar comportamento do sistema
   - Documentar todas as atividades

### 4.3 Análise de Logs
- [ ] **Logs de Sistema** (Windows Event Logs, Syslog)
- [ ] **Logs de Segurança** (Firewall, IDS/IPS)
- [ ] **Logs de Aplicação** (Servidores, bancos de dados)
- [ ] **Logs de Rede** (Capturas de pacotes)
- [ ] **Logs de Backup** (Verificar integridade)

---

## 5. Procedimentos de Recuperação

### 5.1 Avaliação de Opções de Recuperação
1. **Verificar Backups**
   - Confirmar integridade dos backups
   - Testar processo de restauração
   - Verificar se backups não foram comprometidos

2. **Avaliar Decryptors**
   - Consultar No More Ransom Project
   - Verificar disponibilidade de decryptors
   - Testar em ambiente isolado

3. **Considerar Pagamento** (última opção)
   - Consultar equipe jurídica
   - Avaliar riscos e implicações
   - Documentar decisão e justificativa

### 5.2 Processo de Restauração
1. **Preparação do Ambiente**
   - Configurar ambiente limpo
   - Instalar sistema operacional atualizado
   - Aplicar patches de segurança

2. **Restauração de Dados**
   - Restaurar a partir de backups íntegros
   - Verificar integridade dos dados restaurados
   - Testar funcionalidade dos sistemas

3. **Validação Pós-Restauração**
   - Verificar integridade dos dados
   - Testar funcionalidades críticas
   - Executar varredura de segurança
   - Documentar processo e resultados

---

## 6. Procedimentos de Comunicação

### 6.1 Comunicação Interna
- [ ] **Notificação imediata** da gestão
- [ ] **Comunicação com equipes** afetadas
- [ ] **Atualizações regulares** do status
- [ ] **Relatório final** do incidente

### 6.2 Comunicação Externa
- [ ] **Autoridades competentes** (se aplicável)
- [ ] **Clientes afetados** (se necessário)
- [ ] **Fornecedores de segurança**
- [ ] **Seguradoras** (se aplicável)

### 6.3 Documentação
- [ ] **Log de atividades** detalhado
- [ ] **Relatório de incidente**
- [ ] **Lições aprendidas**
- [ ] **Recomendações de melhoria**

---

## 7. Procedimentos de Pós-Incidente

### 7.1 Análise de Causa Raiz
- [ ] **Identificar vetor de ataque**
- [ ] **Analisar vulnerabilidades exploradas**
- [ ] **Revisar controles de segurança**
- [ ] **Documentar falhas identificadas**

### 7.2 Implementação de Melhorias
- [ ] **Correção de vulnerabilidades**
- [ ] **Atualização de controles de segurança**
- [ ] **Treinamento de usuários**
- [ ] **Revisão de políticas e procedimentos**

### 7.3 Monitoramento Contínuo
- [ ] **Implementar monitoramento adicional**
- [ ] **Configurar alertas de segurança**
- [ ] **Revisar logs regularmente**
- [ ] **Testar procedimentos de resposta**

---

## 8. Checklist de Resposta Rápida

### 8.1 Primeiras 15 Minutos
- [ ] Isolar sistema afetado da rede
- [ ] Documentar estado atual
- [ ] Notificar equipe de resposta
- [ ] Fotografar evidências visuais

### 8.2 Primeira Hora
- [ ] Confirmar escopo do incidente
- [ ] Isolar sistemas relacionados
- [ ] Iniciar coleta de evidências
- [ ] Notificar gestão e jurídico

### 8.3 Primeiras 4 Horas
- [ ] Criar imagem forense
- [ ] Iniciar análise de malware
- [ ] Avaliar opções de recuperação
- [ ] Implementar medidas de contenção

### 8.4 Primeiras 24 Horas
- [ ] Completar análise forense inicial
- [ ] Implementar plano de recuperação
- [ ] Comunicar com stakeholders
- [ ] Documentar lições aprendidas

---

## 9. Ferramentas e Recursos

### 9.1 Ferramentas de Análise Forense
- **FTK Imager** - Criação de imagens forenses
- **Autopsy** - Análise forense de disco
- **Volatility** - Análise de memória
- **YARA** - Detecção de malware
- **Wireshark** - Análise de rede

### 9.2 Recursos de Decriptação
- **No More Ransom Project** - Decryptors gratuitos
- **ID Ransomware** - Identificação de ransomware
- **MalwareHunterTeam** - Recursos de decriptação

### 9.3 Contatos de Emergência
| Função | Nome | Contato | Disponibilidade |
|--------|------|---------|-----------------|
| Gerente de Segurança | [Nome] | [Contato] | 24/7 |
| Analista Forense | [Nome] | [Contato] | [Horário] |
| Suporte Técnico | [Nome] | [Contato] | [Horário] |

---

## 10. Aprovações

| Função | Nome | Assinatura | Data |
|--------|------|------------|------|
| Gerente de Segurança | [Nome] | [ ] | [DD/MM/AAAA] |
| Gerente de TI | [Nome] | [ ] | [DD/MM/AAAA] |
| Diretor Executivo | [Nome] | [ ] | [DD/MM/AAAA] |

---

# ============================================================================== 
# PROJETO:      Templates de Procedimentos para Investigação de Ransomware
# ============================================================================== 
# Autor: Jackson A Z Savoldi
# Data: 2025-08-26
# LinkedIn: linkedin.com/in/jacksonzacarias
# Instagram: @jacksonsavoldi
# Formacao: Sistemas de Informacao
# Especializacao: Seguranca da Informacao
# ============================================================================== 

**Template versão:** 1.0  
**Criado em:** [DD/MM/AAAA]  
**Próxima Revisão:** [DD/MM/AAAA]  
**Classificação:** CONFIDENCIAL  
**Baseado em:** ISO 27037, NIST SP 800-86, ABNT NBR ISO/IEC 27001
