# Daily Marketing Discovery — Windows Installer
# Запускай: .\install.ps1

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "╔══════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   Daily Marketing Discovery — Install    ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# 1. Определяем куда ставить скилл
$OpenCodeGlobal = "$env:USERPROFILE\.config\opencode\agents\skills"
$OpenCodeLocal = Join-Path $RepoRoot ".agents\skills"

$Target = $null

if (Test-Path $OpenCodeGlobal) {
    $Target = $OpenCodeGlobal
    Write-Host "→ OpenCode config найден: $Target" -ForegroundColor Green
} elseif (Test-Path $OpenCodeLocal) {
    $Target = $OpenCodeLocal
    Write-Host "→ Локальная .agents папка найдена: $Target" -ForegroundColor Green
} else {
    Write-Host "→ OpenCode не найден. Создаю локальную .agents папку..." -ForegroundColor Yellow
    $Target = $OpenCodeLocal
    New-Item -ItemType Directory -Path $Target -Force | Out-Null
}

# 2. Копируем скилл
$SkillSource = Join-Path $RepoRoot ".agents\skills\daily-discovery"
$SkillDest = Join-Path $Target "daily-discovery"

if (Test-Path $SkillDest) {
    Write-Host "→ Скилл уже установлен. Обновляю..." -ForegroundColor Yellow
    Remove-Item -Path $SkillDest -Recurse -Force
}

Copy-Item -Path $SkillSource -Destination $SkillDest -Recurse -Force
Write-Host "✅ Скилл установлен: $SkillDest" -ForegroundColor Green

# 3. Копируем templates в проект
$TemplatesDest = Join-Path $RepoRoot "templates"
if (Test-Path $TemplatesDest) {
    Write-Host "✅ Шаблоны vault: $TemplatesDest" -ForegroundColor Green
}

# 4. Проверяем .env
$EnvFile = Join-Path $RepoRoot ".env"
if (-not (Test-Path $EnvFile)) {
    Write-Host ""
    Write-Host "⚠️  .env не найден. Хочешь указать путь к vault сейчас?" -ForegroundColor Yellow
    $VaultPath = Read-Host "Путь к Obsidian/Tolaria vault (Enter = пропустить)"
    if ($VaultPath) {
        "TOLARIA_VAULT_PATH=$VaultPath" | Out-File -FilePath $EnvFile -Encoding utf8
        Write-Host "✅ .env создан: TOLARIA_VAULT_PATH=$VaultPath" -ForegroundColor Green
    } else {
        Write-Host "→ Создан .env.example — скопируй в .env и укажи путь" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "╔══════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   Готово! Запусти в OpenCode:            ║" -ForegroundColor Cyan
Write-Host "║                                          ║" -ForegroundColor Cyan
Write-Host "║   /daily-discovery                       ║" -ForegroundColor White
Write-Host "║                                          ║" -ForegroundColor Cyan
Write-Host "╚══════════════════════════════════════════╝" -ForegroundColor Cyan
