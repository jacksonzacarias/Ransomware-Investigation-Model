# Template: Documentação de Ativo Coletado
## Procedimento para Investigação de Ransomware

---

## Metadados do Documento

**ID do Documento:** DOC-ATV-[YYYY]-[###]  
**Data de Criação:** [DD/MM/AAAA HH:MM:SS]  
**Responsável Técnico:** [Nome]  
**Caso Relacionado:** [ID-CASO-YYYY-###]  
**Classificação:** CONFIDENCIAL  
**Versão:** 1.0

---

## 1. Identificação do Ativo

### 1.1 Informações Básicas
- **ID do Ativo:** ATV-[YYYY]-[###]
- **Nome do Dispositivo:** [Nome/Hostname]
- **Tipo de Dispositivo:** [Desktop/Laptop/Servidor/Dispositivo móvel/Outro]
- **Marca/Modelo:** [Marca e modelo]
- **Número de Série:** [Número de série]
- **Data de Fabricação:** [DD/MM/AAAA]
- **Data de Aquisição:** [DD/MM/AAAA]

### 1.2 Localização e Contexto
- **Localização Física:** [Endereço completo]
- **Departamento:** [Departamento responsável]
- **Usuário Principal:** [Nome do usuário]
- **Função no Negócio:** [Descrição da função]
- **Horário de Uso:** [Horários de funcionamento]
- **Conectividade:** [Rede interna/Externa/Isolada]

---

## 2. Especificações Técnicas

### 2.1 Hardware
- **Processador:** [Modelo e velocidade]
- **Memória RAM:** [Quantidade e tipo]
- **Armazenamento Principal:** [Tipo, capacidade, modelo]
- **Armazenamento Secundário:** [Tipo, capacidade, modelo]
- **Placa de Rede:** [Modelo e tipo]
- **Placa Gráfica:** [Modelo]
- **Periféricos Conectados:** [Lista de periféricos]

### 2.2 Software
- **Sistema Operacional:** [SO, versão, build]
- **Arquitetura:** [32-bit/64-bit]
- **Licenças Instaladas:** [Lista de software licenciado]
- **Software de Segurança:** [Antivírus, firewall, etc.]
- **Última Atualização:** [DD/MM/AAAA]
- **Patches de Segurança:** [Status dos patches]

### 2.3 Configuração de Rede
- **Endereço IP:** [IP estático/DHCP]
- **Endereço MAC:** [Endereço MAC]
- **VLAN:** [Número da VLAN]
- **Domínio:** [Nome do domínio]
- **Servidor DNS:** [Endereços DNS]
- **Gateway:** [Endereço do gateway]

---

## 3. Estado do Ativo no Momento da Coleta

### 3.1 Condição Física
- [ ] **Dispositivo Ligado:** [Sim/Não]
- [ ] **Tela Ativa:** [Sim/Não]
- [ ] **Indicadores LED:** [Status dos LEDs]
- [ ] **Ventilação:** [Funcionando/Não funcionando]
- [ ] **Danos Visíveis:** [Sim/Não - Descrever]
- [ ] **Cabo de Rede Conectado:** [Sim/Não]
- [ ] **Periféricos Conectados:** [Lista]

### 3.2 Estado do Sistema
- **Data/Hora do Sistema:** [DD/MM/AAAA HH:MM:SS]
- **Usuário Logado:** [Nome do usuário]
- **Sessões Ativas:** [Número de sessões]
- **Processos em Execução:** [Número de processos]
- **Uso de CPU:** [Percentual]
- **Uso de Memória:** [Percentual]
- **Espaço em Disco:** [Livre/Usado]

### 3.3 Sinais de Comprometimento
- [ ] **Arquivos Criptografados:** [Sim/Não]
- [ ] **Extensões Suspeitas:** [Lista de extensões]
- [ ] **Mensagens de Ransom:** [Sim/Não - Localização]
- [ ] **Processos Suspeitos:** [Lista de processos]
- [ ] **Conexões de Rede Ativas:** [Lista de conexões]
- [ ] **Logs de Sistema Corrompidos:** [Sim/Não]

---

## 4. Processo de Coleta

### 4.1 Isolamento do Ativo
- **Data/Hora do Isolamento:** [DD/MM/AAAA HH:MM:SS]
- **Método de Isolamento:** [Desconexão de rede/Desligamento/Outro]
- **Responsável pelo Isolamento:** [Nome]
- **Autorização:** [Nome do autorizador]
- **Fotografias:** [Número de fotos tiradas]

### 4.2 Coleta de Evidências Físicas
- **Fotografias do Dispositivo:** [Número e localização]
- **Fotografias do Ambiente:** [Número e localização]
- **Etiquetas de Identificação:** [Número de etiquetas]
- **Documentação de Cabos:** [Lista de cabos conectados]
- **Inventário de Periféricos:** [Lista completa]

### 4.3 Coleta de Evidências Digitais
- **Imagem Forense Criada:** [Sim/Não]
- **Ferramenta Utilizada:** [Nome da ferramenta]
- **Tipo de Imagem:** [Raw/E01/Outro]
- **Hash da Imagem:** [SHA256]
- **Local de Armazenamento:** [Caminho]
- **Tempo de Coleta:** [Duração]

---

## 5. Análise Preliminar

### 5.1 Verificação de Integridade
- **Hash do Dispositivo Original:** [SHA256]
- **Hash da Imagem Forense:** [SHA256]
- **Verificação de Integridade:** [OK/Erro]
- **Data da Verificação:** [DD/MM/AAAA HH:MM]
- **Ferramenta de Verificação:** [Nome da ferramenta]

### 5.2 Análise de Malware
- **Antivírus Executado:** [Sim/Não]
- **Ferramenta:** [Nome da ferramenta]
- **Resultado:** [Limpo/Infectado/Inconclusivo]
- **Malware Detectado:** [Lista de malware]
- **Data da Análise:** [DD/MM/AAAA HH:MM]

### 5.3 Análise de Logs
- **Logs de Sistema Coletados:** [Sim/Não]
- **Logs de Segurança Coletados:** [Sim/Não]
- **Logs de Aplicação Coletados:** [Sim/Não]
- **Período dos Logs:** [Data inicial - Data final]
- **Anomalias Detectadas:** [Lista de anomalias]

---

## 6. Cadeia de Custódia

### 6.1 Registro de Custódia
| Data/Hora | Responsável | Ação | Localização | Observações |
|-----------|-------------|------|-------------|-------------|
| [DD/MM/AAAA HH:MM] | [Nome] | [Ação] | [Local] | [Detalhes] |
| [DD/MM/AAAA HH:MM] | [Nome] | [Ação] | [Local] | [Detalhes] |
| [DD/MM/AAAA HH:MM] | [Nome] | [Ação] | [Local] | [Detalhes] |

### 6.2 Controle de Acesso
- **Local de Armazenamento:** [Endereço]
- **Controle de Acesso Físico:** [Implementado/Não implementado]
- **Controle de Acesso Lógico:** [Implementado/Não implementado]
- **Monitoramento:** [Sim/Não]
- **Responsável pela Segurança:** [Nome]

---

## 7. Análise de Impacto

### 7.1 Criticidade do Ativo
- **Nível de Criticidade:** [Crítico/Alto/Médio/Baixo]
- **Justificativa:** [Explicação do nível]
- **Função no Negócio:** [Descrição detalhada]
- **Usuários Afetados:** [Número de usuários]
- **Dados Sensíveis:** [Sim/Não - Tipo]

### 7.2 Impacto do Incidente
- **Tempo de Indisponibilidade:** [Horas/Dias]
- **Perda de Dados:** [Sim/Não - Quantidade]
- **Impacto Financeiro:** [Estimativa]
- **Impacto Operacional:** [Descrição]
- **Impacto na Reputação:** [Avaliação]

---

## 8. Medidas de Contenção

### 8.1 Ações Imediatas
- [ ] **Isolamento da Rede:** [Data/Hora]
- [ ] **Desligamento do Sistema:** [Data/Hora]
- [ ] **Notificação da Equipe:** [Data/Hora]
- [ ] **Preservação de Evidências:** [Data/Hora]
- [ ] **Documentação do Incidente:** [Data/Hora]

### 8.2 Medidas Preventivas
- [ ] **Análise de Vulnerabilidades**
- [ ] **Atualização de Patches**
- [ ] **Reforço de Segurança**
- [ ] **Treinamento de Usuários**
- [ ] **Revisão de Políticas**

---

## 9. Recomendações

### 9.1 Ações Imediatas
1. [Recomendação 1]
2. [Recomendação 2]
3. [Recomendação 3]

### 9.2 Ações de Médio Prazo
1. [Recomendação 1]
2. [Recomendação 2]
3. [Recomendação 3]

### 9.3 Ações de Longo Prazo
1. [Recomendação 1]
2. [Recomendação 2]
3. [Recomendação 3]

---

## 10. Anexos

### 10.1 Documentos Relacionados
- [ ] Relatório de análise forense
- [ ] Logs de sistema
- [ ] Fotografias do dispositivo
- [ ] Certificados de integridade
- [ ] Relatório de antivírus

### 10.2 Evidências Digitais
- **Imagem Forense:** [Localização]
- **Logs Coletados:** [Localização]
- **Arquivos Suspeitos:** [Localização]
- **Hash de Verificação:** [SHA256]

---

## 11. Aprovações

| Função | Nome | Assinatura | Data |
|--------|------|------------|------|
| Responsável Técnico | [Nome] | [ ] | [DD/MM/AAAA] |
| Analista Forense | [Nome] | [ ] | [DD/MM/AAAA] |
| Gerente de Segurança | [Nome] | [ ] | [DD/MM/AAAA] |

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
