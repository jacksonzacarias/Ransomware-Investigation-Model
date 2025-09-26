---
```
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

```
# Templates de Procedimentos para Investigação de Ransomware
## Documentação Bilíngue (Português Brasileiro e Italiano)

---

# Template: Documentação de Evidência

## Metadados da Evidência

**ID da Evidência:** EVD-[YYYY]-[###]  
**Data de Coleta:** [DD/MM/AAAA HH:MM:SS]  
**Auditor Responsável:** [Nome]  
**Vulnerabilidade Relacionada:** [VULN-YYYY-###]  

## Informações Técnicas

### Tipo de Evidência
- [ ] Screenshot
- [ ] Log de sistema
- [ ] Captura de rede (PCAP)
- [ ] Arquivo obtido
- [ ] Output de ferramenta
- [ ] Código fonte
- [ ] Banco de dados
- [ ] Outro: [especificar]

### Sistema/Aplicação
- **Nome:** [Sistema afetado]
- **Versão:** [Versão do software]
- **IP/URL:** [Endereço do alvo]
- **Porta/Serviço:** [Se aplicável]

## Processo de Coleta

### Ferramenta Utilizada
- **Nome:** [Nome da ferramenta]
- **Versão:** [Versão da ferramenta]
- **Comando/Configuração:** 
```bash
[Comando exato utilizado]
```

### Contexto da Coleta
[Descrição do que estava sendo testado quando a evidência foi coletada]

### Condições do Ambiente
- **Data/Hora:** [Timestamp exato]
- **Rede:** [Interna/Externa/VPN/etc.]
- **Credenciais:** [Se utilizadas - SEM senhas]
- **Privilégios:** [Nível de acesso durante coleta]

## Descrição da Evidência

### Resumo
[Descrição clara do que a evidência demonstra]

### Detalhes Relevantes
[Pontos específicos que a evidência comprova ou demonstra]

### Relação com Vulnerabilidade
[Como esta evidência suporta a descoberta da vulnerabilidade]

## Informações do Arquivo

### Para Screenshots
- **Resolução:** [1920x1080, etc.]
- **Formato:** [PNG/JPG/etc.]
- **Tamanho:** [KB/MB]
- **Edições:** [Markup, censura, etc.]

### Para Logs/Outputs
- **Formato:** [TXT/CSV/JSON/etc.]
- **Tamanho:** [Número de linhas/bytes]
- **Encoding:** [UTF-8/ASCII/etc.]
- **Filtros Aplicados:** [Se logs foram filtrados]

### Para Arquivos Obtidos
- **Tipo:** [Documento/Código/Config/etc.]
- **Tamanho Original:** [Bytes]
- **Hash MD5:** [hash]
- **Hash SHA256:** [hash]

## Localização e Referência

### Arquivo Principal
**Caminho:** `evidencias/[categoria]/[nome_arquivo]`  
**Nome Original:** [Se renomeado]  
**Backup:** [Local do backup]

### Referências no Relatório
- **Seção:** [Onde será referenciada]
- **Figura/Tabela:** [Número da figura]
- **Página:** [Página aproximada]

## Tratamento e Formatação

### Para Inclusão no Relatório
- [ ] Imagem redimensionada adequadamente
- [ ] Informações sensíveis censuradas
- [ ] Legenda preparada
- [ ] Qualidade verificada para impressão

### Legenda Sugerida
```
Figura X.X: [Descrição clara da evidência]
Fonte: [Ferramenta/Sistema] - [Data]
```

### Observações de Formatação
[Notas sobre como a evidência deve ser apresentada no relatório]

## Cadeia de Custódia

### Coleta
- **Por:** [Nome do auditor]
- **Data/Hora:** [Timestamp]
- **Método:** [Como foi coletada]

### Armazenamento
- **Local Inicial:** [Onde foi salva primeiro]
- **Backup:** [Onde está o backup]
- **Proteção:** [Criptografia/Permissões]

### Acessos
| Data/Hora | Pessoa | Ação | Motivo |
|-----------|--------|------|--------|
| [timestamp] | [nome] | [ação] | [justificativa] |

## Validação e Integridade

### Verificações Realizadas
- [ ] Hash calculado e verificado
- [ ] Timestamp validado
- [ ] Conteúdo íntegro
- [ ] Metadados preservados

### Checksums
```
MD5: [hash]
SHA256: [hash]
```

### Validador
**Nome:** [Quem validou]  
**Data:** [Quando foi validada]  
**Método:** [Como foi validada]

## Análise da Evidência

### Relevância
- **Criticidade:** [Alta/Média/Baixa]
- **Tipo de Prova:** [Direta/Circunstancial/Suporte]
- **Impacto:** [Como influencia o caso]

### Limitações
[Qualquer limitação ou contexto que afete a interpretação da evidência]

### Correlação
[Como esta evidência se relaciona com outras evidências coletadas]

## Observações Adicionais

### Comentários do Auditor
[Insights, observações técnicas, contexto adicional]

### Ações de Follow-up
- [ ] [Ação 1 necessária]
- [ ] [Ação 2 necessária]
- [ ] [Ação 3 necessária]

### Status
- **Estado:** [Coletada/Processada/Incluída/Arquivada]
- **Última Atualização:** [Data]
- **Próxima Ação:** [O que precisa ser feito]

---

**Template versão:** 1.0  
**Criado em:** 06/08/2025  
**Classificação:** CONFIDENCIAL