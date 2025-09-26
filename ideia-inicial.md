Resumo dos estudos para criar templetes dos procedimentos.

Formulário de Chain of Custody (SANS) — formulário pronto para impressão e assinatura (use para cada evidência física/arquivo). 
SANS Institute

Sample Chain of Custody (NIST / DOCX) — template oficial de cadeia de custódia (NIST). 
NIST

ISO 27037 (resumo / guia) — para justificar processos e requisitos legais em relatórios. 
iso.org
+1

(Se quiser, eu adapto um desses templates para o seu relatório em formato .docx ou .pdf — diga qual.)

Ferramentas e equipamentos — lista prática (essencial → opcional)
Hardware (prioridade)

Write-blockers (hardware) — Tableau (T8u), CRU/Wiebetech (USB/NVMe), Digital Intelligence Ultrakit. Use sempre hardware para evidências. 
forensiccomputers.com
+2
forensiccomputers.com
+2

Estações forenses / workstation isolada (sem rede ou com rede controlada).

Mídias de armazenamento seguras (HDs externos/RAID para armazenar imagens, com controle de acesso).

Etiquetas / câmera — registrar fotos do equipamento e do estado físico.

Software de aquisição / imagem

FTK Imager (Windows — cria imagens raw e E01).

dd / dcfldd / dc3dd (Linux — cópia bit-for-bit; dcfldd cria hashes on-the-fly).

ddrescue (para discos com setores defeituosos).

ewfacquire / libewf (para criar E01).

Guymager (GUI Linux para aquisição forense). 
Salvation DATA
+1

Ferramentas de análise (estática / dinâmica)

Autopsy + Sleuth Kit (análise forense de disco).

hashdeep / md5sum / sha256sum (verificação de integridade).

YARA (regras para identificar malware).

VirusTotal / Hybrid Analysis (verificação de amostras).

Volatility / Rekall (análise de memória).

Wireshark / tcpdump (captura/análise de rede em laboratório). 
cugu.github.io

Recursos de chaves / decriptação

No More Ransom — projetos e decryptors públicos (verificar se há solução). (use antes de tentar manipular arquivos criptografados).

Procedimentos práticos (mapeados para as 12 etapas) — comandos e exemplos rápidos

Isolar o ativo (desligar rede / desconectar cabos).

Ação: desligar NICs, retirar cabo de rede e Wi-Fi; registrar hora.

Remover os discos do equipamento.

Ação: fotografar o equipamento, anotar serial/modelo/porta; preencher Chain of Custody.

Conectar disco à estação forense com hardware write-blocker.

Exemplo: conectar SATA/USB ao Tableau/CRU; verificar LEDs e logs do write-blocker. 
forensiccomputers.com
+1

Registrar metadados iniciais (data/hora, operador, modelo, serial, fotos).

Preencha o formulário Chain of Custody (SANS/NIST). 
SANS Institute
+1

Criar forensic image (bit-for-bit) — escolha raw ou E01:

dcfldd if=/dev/sdX of=/mnt/forensics/image.dd hash=sha256 log=dcfldd.log

Ou, para E01: ewfacquire -u -t "Caso123" -c 4096 /dev/sdX /mnt/forensic/image.E01 (ewfacquire gera metadados).

Se disco com setores defeituosos: ddrescue -v /dev/sdX /mnt/forensic/image.dd /mnt/forensic/image.log.
(Use write-blocker entre o disco e a máquina durante todos esses passos.) 
Salvation DATA
+1

Calcular e registrar hash do original e da imagem (SHA-256 / SHA-512).

sha256sum /dev/sdX (se o sistema permitir leitura do bloco) ou confiar no hash gerado por dcfldd/ewfacquire.

sha256sum /mnt/forensic/image.dd > image.sha256

Fazer cópias verificadas da imagem (cada cópia com seu hash).

cp image.dd /mnt/storage/image_copy1.dd && sha256sum image_copy1.dd > copy1.sha256

Mantenha registro de quem fez cada cópia no Chain of Custody.

Análise estática nas cópias (YARA, antivírus, strings, bancos de hashes).

yara rules.yar image.dd

bulk_extractor image.dd / fls / icat (SleuthKit) / strings image.dd | grep -i ransom

Consultar Hashes no VirusTotal / ThreatIntel.

Se necessário executar dinamicamente, usar VM isolada com snapshot e rede controlada.

Configurar VM sem bridge com host, usar NAT ou rede isolada; ativar snapshot antes de cada execução; após análise, reverter snapshot.

Nunca dar acesso a recursos reais (backups / servidores).

Documentar todos os testes e resultados; preservar a imagem original intacta.

Use logs (dcfldd.log, ewfacquire metadata) e registre em relatório: data/hora/comandos/resultados/hashes.

Restaurar snapshots e isolar resultados; não permitir acesso a backups/produção.

Fluxo: cada execução → gerar artefatos em storage isolado → marcar com ID do caso.

Encerrar com relatório e preservação das evidências (cadeia de custódia).

Incluir: descrição do dispositivo, fotografias, cópia dos hashes, logs da aquisição, passo a passo dos testes, resultados, recomendações.

Checklists rápidos (copiar/colar)

Checklist de aquisição (mini):

 Isolar ativo (desconectar rede)

 Fotografar e anotar serial/modelo

 Preencher Chain of Custody (SANS/NIST)

 Conectar via write-blocker (Tableau/CRU)

 Criar imagem (dcfldd / ewfacquire / ddrescue)

 Calcular SHA-256/SHA-512 e salvar logs

 Fazer cópias verificadas e documentar

Checklist de análise dinâmica (mini):

 Usar VM isolada com snapshot

 Rede controlada / sem acesso a produção

 Capturar tráfego (tcpdump/Wireshark)

 Reverter snapshot após execução

Onde baixar / consultar os templates agora

Chain of Custody — SANS (PDF): exemplo prático de formulário de evidência. 
SANS Institute

Sample Chain of Custody — NIST (DOCX): template. 
NIST

NIST SP 800-86 (PDF): guia oficial. 
nvlpubs.nist.gov

ISO 27037 (página resumo / compra): informação sobre o padrão.