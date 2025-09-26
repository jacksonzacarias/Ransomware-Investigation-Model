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

# Template: Procedimenti per Investigazione Ransomware
## Guida di Risposta agli Incidenti

---

## Metadati del Documento

**ID del Documento:** DOC-PROC-[YYYY]-[###]  
**Data di Creazione:** [DD/MM/AAAA HH:MM:SS]  
**Responsabile Tecnico:** [Nome]  
**Caso Correlato:** [ID-CASO-YYYY-###]  
**Classificazione:** CONFIDENZIALE  
**Versione:** 1.0

---

## 1. Panoramica dei Procedimenti

### 1.1 Obiettivo
Questo documento stabilisce i procedimenti standardizzati per la risposta agli incidenti di ransomware, inclusi:
- Rilevamento e conferma degli attacchi
- Isolamento e contenimento dei sistemi interessati
- Analisi forense e investigazione
- Recupero e ripristino
- Prevenzione di futuri attacchi

### 1.2 Ambito
- Sistemi sospetti di infezione da ransomware
- Sistemi già compromessi e crittografati
- Analisi di prove digitali
- Coordinamento con team interni ed esterni
- Documentazione e rapporti

### 1.3 Responsabilità
- **Team di Sicurezza:** Analisi e investigazione
- **Team IT:** Isolamento e recupero tecnico
- **Management:** Approvazioni e comunicazione
- **Legale:** Aspetti legali e normativi

---

## 2. Procedimenti di Rilevamento e Conferma

### 2.1 Segnali di Allarme
- [ ] **File con estensioni sospette** (.locked, .encrypted, .crypto, ecc.)
- [ ] **Messaggi di riscatto** su schermi o file
- [ ] **Modifiche alle estensioni dei file** senza autorizzazione
- [ ] **Attività di rete anomala** (connessioni sospette)
- [ ] **Processi sconosciuti** in esecuzione
- [ ] **Log di sistema corrotti** o mancanti
- [ ] **Antivirus disabilitato** o corrotto
- [ ] **Backup corrotti** o inaccessibili

### 2.2 Procedimento di Conferma
1. **Isolamento Immediato**
   - Disconnettere dalla rete (cavo e Wi-Fi)
   - Non spegnere il sistema immediatamente
   - Documentare lo stato attuale

2. **Raccolta di Prove Iniziali**
   - Fotografare schermo e messaggi
   - Annotare data/ora dell'incidente
   - Registrare utente connesso
   - Elencare processi in esecuzione

3. **Notifica del Team**
   - Attivare team di risposta agli incidenti
   - Notificare il management immediatamente
   - Comunicare con il team legale se necessario

---

## 3. Procedimenti di Isolamento e Contenimento

### 3.1 Isolamento dei Sistemi Interessati
- [ ] **Disconnettere dalla rete** (fisico e logico)
- [ ] **Disabilitare interfacce di rete** nel sistema
- [ ] **Isolare in VLAN** separata se necessario
- [ ] **Documentare ora dell'isolamento**
- [ ] **Notificare team di rete**

### 3.2 Contenimento della Propagazione
- [ ] **Verificare altri sistemi** nella stessa rete
- [ ] **Analizzare log di firewall** e IDS/IPS
- [ ] **Verificare backup** per integrità
- [ ] **Isolare sistemi correlati**
- [ ] **Implementare regole firewall** temporanee

### 3.3 Preservazione delle Prove
- [ ] **Non spegnere sistemi** interessati
- [ ] **Creare immagine forense** prima di qualsiasi azione
- [ ] **Documentare stato** di tutti i sistemi
- [ ] **Preservare log** di sistema e rete
- [ ] **Mantenere catena di custodia**

---

## 4. Procedimenti di Analisi Forense

### 4.1 Raccolta di Prove
1. **Preparazione dell'Ambiente**
   - Configurare stazione forense isolata
   - Verificare strumenti forensi
   - Preparare supporti di archiviazione

2. **Creazione di Immagine Forense**
   ```bash
   # Esempio di comando per immagine forense
   dcfldd if=/dev/sdX of=/mnt/forensics/image.dd hash=sha256 log=dcfldd.log
   ```

3. **Verifica di Integrità**
   - Calcolare hash SHA-256 dell'immagine
   - Confrontare con hash del dispositivo originale
   - Documentare tutti gli hash

### 4.2 Analisi Malware
1. **Analisi Statica**
   - Eseguire antivirus aggiornato
   - Analisi con regole YARA
   - Verifica hash in database
   - Analisi di stringhe e metadati

2. **Analisi Dinamica** (in ambiente controllato)
   - Eseguire in VM isolata
   - Catturare traffico di rete
   - Monitorare comportamento del sistema
   - Documentare tutte le attività

### 4.3 Analisi dei Log
- [ ] **Log di Sistema** (Windows Event Logs, Syslog)
- [ ] **Log di Sicurezza** (Firewall, IDS/IPS)
- [ ] **Log di Applicazione** (Server, database)
- [ ] **Log di Rete** (Catture di pacchetti)
- [ ] **Log di Backup** (Verificare integrità)

---

## 5. Procedimenti di Recupero

### 5.1 Valutazione delle Opzioni di Recupero
1. **Verificare Backup**
   - Confermare integrità dei backup
   - Testare processo di ripristino
   - Verificare che i backup non siano stati compromessi

2. **Valutare Decryptor**
   - Consultare No More Ransom Project
   - Verificare disponibilità di decryptor
   - Testare in ambiente isolato

3. **Considerare Pagamento** (ultima opzione)
   - Consultare team legale
   - Valutare rischi e implicazioni
   - Documentare decisione e giustificazione

### 5.2 Processo di Ripristino
1. **Preparazione dell'Ambiente**
   - Configurare ambiente pulito
   - Installare sistema operativo aggiornato
   - Applicare patch di sicurezza

2. **Ripristino dei Dati**
   - Ripristinare da backup integri
   - Verificare integrità dei dati ripristinati
   - Testare funzionalità dei sistemi

3. **Validazione Post-Ripristino**
   - Verificare integrità dei dati
   - Testare funzionalità critiche
   - Eseguire scansione di sicurezza
   - Documentare processo e risultati

---

## 6. Procedimenti di Comunicazione

### 6.1 Comunicazione Interna
- [ ] **Notifica immediata** del management
- [ ] **Comunicazione con team** interessati
- [ ] **Aggiornamenti regolari** dello stato
- [ ] **Rapporto finale** dell'incidente

### 6.2 Comunicazione Esterna
- [ ] **Autorità competenti** (se applicabile)
- [ ] **Clienti interessati** (se necessario)
- [ ] **Fornitori di sicurezza**
- [ ] **Assicurazioni** (se applicabile)

### 6.3 Documentazione
- [ ] **Log delle attività** dettagliato
- [ ] **Rapporto dell'incidente**
- [ ] **Lezioni apprese**
- [ ] **Raccomandazioni di miglioramento**

---

## 7. Procedimenti Post-Incidente

### 7.1 Analisi della Causa Principale
- [ ] **Identificare vettore di attacco**
- [ ] **Analizzare vulnerabilità sfruttate**
- [ ] **Rivedere controlli di sicurezza**
- [ ] **Documentare fallimenti identificati**

### 7.2 Implementazione di Miglioramenti
- [ ] **Correzione di vulnerabilità**
- [ ] **Aggiornamento controlli di sicurezza**
- [ ] **Formazione degli utenti**
- [ ] **Revisione di politiche e procedimenti**

### 7.3 Monitoraggio Continuo
- [ ] **Implementare monitoraggio aggiuntivo**
- [ ] **Configurare alert di sicurezza**
- [ ] **Rivedere log regolarmente**
- [ ] **Testare procedimenti di risposta**

---

## 8. Checklist di Risposta Rapida

### 8.1 Prime 15 Minuti
- [ ] Isolare sistema interessato dalla rete
- [ ] Documentare stato attuale
- [ ] Notificare team di risposta
- [ ] Fotografare prove visive

### 8.2 Prima Ora
- [ ] Confermare ambito dell'incidente
- [ ] Isolare sistemi correlati
- [ ] Iniziare raccolta di prove
- [ ] Notificare management e legale

### 8.3 Prime 4 Ore
- [ ] Creare immagine forense
- [ ] Iniziare analisi malware
- [ ] Valutare opzioni di recupero
- [ ] Implementare misure di contenimento

### 8.4 Prime 24 Ore
- [ ] Completare analisi forense iniziale
- [ ] Implementare piano di recupero
- [ ] Comunicare con stakeholder
- [ ] Documentare lezioni apprese

---

## 9. Strumenti e Risorse

### 9.1 Strumenti di Analisi Forense
- **FTK Imager** - Creazione di immagini forensi
- **Autopsy** - Analisi forense del disco
- **Volatility** - Analisi della memoria
- **YARA** - Rilevamento malware
- **Wireshark** - Analisi di rete

### 9.2 Risorse di Decrittazione
- **No More Ransom Project** - Decryptor gratuiti
- **ID Ransomware** - Identificazione ransomware
- **MalwareHunterTeam** - Risorse di decrittazione

### 9.3 Contatti di Emergenza
| Funzione | Nome | Contatto | Disponibilità |
|----------|------|----------|---------------|
| Manager di Sicurezza | [Nome] | [Contatto] | 24/7 |
| Analista Forense | [Nome] | [Contatto] | [Orario] |
| Supporto Tecnico | [Nome] | [Contatto] | [Orario] |

---

## 10. Approvazioni

| Funzione | Nome | Firma | Data |
|----------|------|-------|------|
| Manager di Sicurezza | [Nome] | [ ] | [DD/MM/AAAA] |
| Manager IT | [Nome] | [ ] | [DD/MM/AAAA] |
| Direttore Esecutivo | [Nome] | [ ] | [DD/MM/AAAA] |

---

**Template versione:** 1.0  
**Creato il:** [DD/MM/AAAA]  
**Prossima Revisione:** [DD/MM/AAAA]  
**Classificazione:** CONFIDENZIALE  
**Basato su:** ISO 27037, NIST SP 800-86, UNI CEI EN ISO/IEC 27001
