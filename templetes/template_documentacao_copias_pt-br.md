# Template: Documentação de Cópias de Segurança (Backups)
## Procedimento para Investigação de Ransomware

---

## Metadados do Documento

**ID do Documento:** DOC-BKP-[YYYY]-[###]  
**Data de Criação:** [DD/MM/AAAA HH:MM:SS]  
**Responsável Técnico:** [Nome]  
**Caso Relacionado:** [ID-CASO-YYYY-###]  
**Classificação:** CONFIDENCIAL  
**Versão:** 1.0

---

## 1. Informações Gerais do Sistema

### 1.1 Identificação do Sistema
- **Nome do Sistema:** [Nome do sistema afetado]
- **Tipo:** [Servidor/Workstation/Dispositivo móvel/Outro]
- **Localização Física:** [Endereço completo]
- **Responsável Técnico:** [Nome e contato]
- **Departamento:** [Departamento responsável]

### 1.2 Especificações Técnicas
- **Sistema Operacional:** [SO e versão]
- **Arquitetura:** [32-bit/64-bit]
- **Capacidade de Armazenamento:** [GB/TB]
- **Tipo de Armazenamento:** [HDD/SSD/NVMe/RAID]
- **Configuração de Rede:** [IP, VLAN, etc.]

---

## 2. Inventário de Cópias de Segurança

### 2.1 Cópias de Segurança Existentes

| ID Backup | Tipo | Localização | Frequência | Última Execução | Status | Responsável |
|-----------|------|-------------|------------|-----------------|--------|-------------|
| BKP-001 | [Completo/Incremental/Diferencial] | [Caminho/Local] | [Diário/Semanal/Mensal] | [DD/MM/AAAA HH:MM] | [OK/Erro/Pendente] | [Nome] |
| BKP-002 | [Completo/Incremental/Diferencial] | [Caminho/Local] | [Diário/Semanal/Mensal] | [DD/MM/AAAA HH:MM] | [OK/Erro/Pendente] | [Nome] |
| BKP-003 | [Completo/Incremental/Diferencial] | [Caminho/Local] | [Diário/Semanal/Mensal] | [DD/MM/AAAA HH:MM] | [OK/Erro/Pendente] | [Nome] |

### 2.2 Detalhamento por Backup

#### Backup ID: BKP-001
- **Tipo de Backup:** [Completo/Incremental/Diferencial]
- **Ferramenta Utilizada:** [Nome da ferramenta e versão]
- **Localização Física:** [Endereço completo]
- **Localização Lógica:** [Caminho no sistema]
- **Tamanho:** [GB/TB]
- **Compressão:** [Sim/Não - Tipo]
- **Criptografia:** [Sim/Não - Algoritmo]
- **Integridade Verificada:** [Sim/Não - Hash]
- **Última Verificação:** [DD/MM/AAAA HH:MM]
- **Próxima Execução Programada:** [DD/MM/AAAA HH:MM]

#### Backup ID: BKP-002
- **Tipo de Backup:** [Completo/Incremental/Diferencial]
- **Ferramenta Utilizada:** [Nome da ferramenta e versão]
- **Localização Física:** [Endereço completo]
- **Localização Lógica:** [Caminho no sistema]
- **Tamanho:** [GB/TB]
- **Compressão:** [Sim/Não - Tipo]
- **Criptografia:** [Sim/Não - Algoritmo]
- **Integridade Verificada:** [Sim/Não - Hash]
- **Última Verificação:** [DD/MM/AAAA HH:MM]
- **Próxima Execução Programada:** [DD/MM/AAAA HH:MM]

---

## 3. Procedimentos de Verificação

### 3.1 Verificação de Integridade
- [ ] **Hash MD5 Calculado:** [hash]
- [ ] **Hash SHA256 Calculado:** [hash]
- [ ] **Verificação de Integridade:** [OK/Erro]
- [ ] **Data da Verificação:** [DD/MM/AAAA HH:MM]
- [ ] **Responsável pela Verificação:** [Nome]

### 3.2 Teste de Restauração
- [ ] **Teste Realizado:** [Sim/Não]
- [ ] **Data do Teste:** [DD/MM/AAAA HH:MM]
- [ ] **Ambiente de Teste:** [Descrição]
- [ ] **Resultado:** [Sucesso/Erro/Parcial]
- [ ] **Observações:** [Detalhes do teste]
- [ ] **Responsável pelo Teste:** [Nome]

---

## 4. Análise de Vulnerabilidades

### 4.1 Acessibilidade dos Backups
- [ ] **Backup Conectado à Rede:** [Sim/Não]
- [ ] **Backup Acessível Remotamente:** [Sim/Não]
- [ ] **Permissões de Acesso:** [Detalhar]
- [ ] **Controle de Acesso:** [Implementado/Não implementado]

### 4.2 Segurança Física
- [ ] **Local Seguro:** [Sim/Não]
- [ ] **Controle de Acesso Físico:** [Implementado/Não implementado]
- [ ] **Monitoramento:** [Sim/Não]
- [ ] **Proteção contra Desastres:** [Sim/Não]

---

## 5. Plano de Recuperação

### 5.1 Priorização de Restauração
1. **Crítico (0-4 horas):** [Lista de sistemas/dados]
2. **Alto (4-24 horas):** [Lista de sistemas/dados]
3. **Médio (1-3 dias):** [Lista de sistemas/dados]
4. **Baixo (3-7 dias):** [Lista de sistemas/dados]

### 5.2 Procedimentos de Restauração
- **Ambiente de Restauração:** [Descrição]
- **Ferramentas Necessárias:** [Lista]
- **Tempo Estimado:** [Horas/Dias]
- **Recursos Humanos:** [Número de pessoas]
- **Recursos Técnicos:** [Equipamentos necessários]

### 5.3 Validação Pós-Restauração
- [ ] **Verificação de Integridade dos Dados**
- [ ] **Teste de Funcionalidade**
- [ ] **Verificação de Segurança**
- [ ] **Documentação dos Resultados**

---

## 6. Contatos e Responsabilidades

### 6.1 Equipe de Backup
| Função | Nome | Contato | Disponibilidade |
|--------|------|---------|-----------------|
| Responsável Técnico | [Nome] | [Email/Telefone] | [Horário] |
| Administrador de Sistema | [Nome] | [Email/Telefone] | [Horário] |
| Analista de Segurança | [Nome] | [Email/Telefone] | [Horário] |

### 6.2 Fornecedores e Suporte
| Fornecedor | Serviço | Contato | SLA |
|------------|---------|---------|-----|
| [Nome] | [Serviço] | [Contato] | [Tempo] |
| [Nome] | [Serviço] | [Contato] | [Tempo] |

---

## 7. Log de Atividades

| Data/Hora | Ação | Responsável | Observações |
|-----------|------|-------------|-------------|
| [DD/MM/AAAA HH:MM] | [Ação realizada] | [Nome] | [Detalhes] |
| [DD/MM/AAAA HH:MM] | [Ação realizada] | [Nome] | [Detalhes] |
| [DD/MM/AAAA HH:MM] | [Ação realizada] | [Nome] | [Detalhes] |

---

## 8. Anexos

### 8.1 Documentos Relacionados
- [ ] Logs de backup
- [ ] Relatórios de verificação
- [ ] Certificados de integridade
- [ ] Manuais de procedimento
- [ ] Contratos de suporte

### 8.2 Evidências Digitais
- **Localização:** [Caminho dos arquivos]
- **Hash de Verificação:** [hash]
- **Data de Criação:** [DD/MM/AAAA HH:MM]
- **Responsável:** [Nome]

---

## 9. Aprovações

| Função | Nome | Assinatura | Data |
|--------|------|------------|------|
| Responsável Técnico | [Nome] | [ ] | [DD/MM/AAAA] |
| Gerente de TI | [Nome] | [ ] | [DD/MM/AAAA] |
| Analista de Segurança | [Nome] | [ ] | [DD/MM/AAAA] |

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
