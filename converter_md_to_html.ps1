# Script para converter Markdown para HTML
# Uso: .\converter_md_to_html.ps1

$mdFile = "Relatorio_Incidente_Ransomware_FS_Profissional.md"
$htmlFile = "Relatorio_Incidente_Ransomware_FS_Profissional.html"

# Verificar se o arquivo Markdown existe
if (-not (Test-Path $mdFile)) {
    Write-Error "Arquivo $mdFile não encontrado!"
    exit 1
}

Write-Host "Convertendo $mdFile para HTML..."

# Ler o conteúdo do Markdown
$content = Get-Content $mdFile -Raw -Encoding UTF8

# HTML template com CSS profissional
$htmlTemplate = @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório de Incidente de Ransomware - FS</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            color: #333;
            background-color: #f8f9fa;
        }
        
        .container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        h1 {
            color: #dc3545;
            border-bottom: 3px solid #dc3545;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }
        
        h2 {
            color: #495057;
            border-left: 4px solid #dc3545;
            padding-left: 15px;
            margin-top: 40px;
        }
        
        h3 {
            color: #6c757d;
            margin-top: 30px;
        }
        
        h4 {
            color: #495057;
            margin-top: 25px;
        }
        
        .alert {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
        }
        
        .success {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        
        th, td {
            border: 1px solid #dee2e6;
            padding: 12px;
            text-align: left;
        }
        
        th {
            background-color: #e9ecef;
            font-weight: bold;
        }
        
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        code {
            background-color: #f8f9fa;
            padding: 2px 4px;
            border-radius: 3px;
            font-family: 'Courier New', monospace;
        }
        
        pre {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 4px;
            overflow-x: auto;
            border-left: 4px solid #dc3545;
        }
        
        img {
            max-width: 100%;
            height: auto;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            margin: 10px 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .page-break {
            page-break-before: always;
        }
        
        .footer {
            margin-top: 50px;
            padding-top: 20px;
            border-top: 2px solid #dee2e6;
            text-align: center;
            color: #6c757d;
            font-size: 12px;
        }
        
        ul, ol {
            padding-left: 30px;
        }
        
        li {
            margin: 5px 0;
        }
        
        blockquote {
            border-left: 4px solid #dc3545;
            margin: 20px 0;
            padding-left: 20px;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        $content
        <div class="footer">
            <p>Relatório gerado automaticamente pelo SOC_AL3RT</p>
            <p>Jackson Antonio Zacarias Savoldi - Analista de Segurança Cibernética</p>
        </div>
    </div>
</body>
</html>
"@

# Converter Markdown básico para HTML
$htmlContent = $content

# Converter cabeçalhos
$htmlContent = $htmlContent -replace '^# (.*)$', '<h1>$1</h1>'
$htmlContent = $htmlContent -replace '^## (.*)$', '<h2>$1</h2>'
$htmlContent = $htmlContent -replace '^### (.*)$', '<h3>$1</h3>'
$htmlContent = $htmlContent -replace '^#### (.*)$', '<h4>$1</h4>'

# Converter listas
$htmlContent = $htmlContent -replace '^- (.*)$', '<li>$1</li>'
$htmlContent = $htmlContent -replace '^\* (.*)$', '<li>$1</li>'

# Converter código
$htmlContent = $htmlContent -replace '```(.*?)```', '<pre><code>$1</code></pre>'
$htmlContent = $htmlContent -replace '`(.*?)`', '<code>$1</code>'

# Converter imagens
$htmlContent = $htmlContent -replace '!\[(.*?)\]\((.*?)\)', '<img src="$2" alt="$1" title="$1">'

# Converter negrito
$htmlContent = $htmlContent -replace '\*\*(.*?)\*\*', '<strong>$1</strong>'

# Converter itálico
$htmlContent = $htmlContent -replace '\*(.*?)\*', '<em>$1</em>'

# Converter links
$htmlContent = $htmlContent -replace '\[(.*?)\]\((.*?)\)', '<a href="$2">$1</a>'

# Converter tabelas básicas
$htmlContent = $htmlContent -replace '\|(.*?)\|', '<tr><td>$1</td></tr>'

# Adicionar quebras de linha
$htmlContent = $htmlContent -replace '\n', '<br>'

# Substituir no template
$finalHtml = $htmlTemplate -replace '\$content', $htmlContent

# Salvar o HTML
$finalHtml | Out-File -FilePath $htmlFile -Encoding UTF8

Write-Host "✅ Conversão concluída!"
Write-Host "📄 Arquivo HTML criado: $htmlFile"
Write-Host ""
Write-Host "📋 Próximos passos:"
Write-Host "1. Abra o arquivo HTML no navegador"
Write-Host "2. Use Ctrl+P para imprimir"
Write-Host "3. Selecione 'Salvar como PDF'"
Write-Host "4. Configure margens e orientação conforme necessário"
Write-Host ""
Write-Host "🎯 Ou use o comando abaixo para abrir automaticamente:"
Write-Host "Start-Process `"$htmlFile`""
