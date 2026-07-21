# Troubleshooting

## Vault not found

**Симптом:** `TOLARIA_VAULT_PATH not set`

**Решение:**
```bash
# Временно
$env:TOLARIA_VAULT_PATH = "C:/MyVault"

# Навсегда (Windows)
[System.Environment]::SetEnvironmentVariable("TOLARIA_VAULT_PATH", "C:/MyVault", "User")

# .env файл (рекомендуется)
echo "TOLARIA_VAULT_PATH=C:/MyVault" > .env
```

## Product Hunt blocked

**Симптом:** 403 или пустая страница

**Решение:**
- web search: `"product hunt" "top launches" {YYYY-MM-DD}`
- Или: `https://www.producthunt.com/leaderboard/daily/{YYYY-MM-DD}`

## GitHub Trending не парсится

**Симптом:** звезды не отображаются

**Решение:**
- web search: `"github trending" {YYYY-MM-DD} stars`
- Или через `gh` CLI: `gh search repos --sort stars --limit 10`

## Поиск выдаёт SEO-мусор

**Симптом:** вместо кейсов — "best practices" статьи

**Решение:**
- Добавь `site:lbbonline.com` или `site:adweek.com`
- Отфильтруй: `-seo -"best practices" -"tips for" -"guide to"`

## Очередь принципов пуста

**Симптом:** нет QUEUE.md или все 72 пройдены

**Решение:**
- Скопируй `templates/vault/marketing-discovery/psyche/QUEUE.md`
- Если все пройдены — сбрось отметки или начни deep-dive цикл (Pool B)

## Контекст переполняется

**Симптом:** агент не успевает выполнить все шаги

**Решение:**
- Шаги 1-3 запускай параллельными background task'ами
- Если заметки за сегодня уже есть — спроси пользователя: перезаписать?
