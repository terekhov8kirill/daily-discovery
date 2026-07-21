---
name: daily-discovery
description: >
  Маркетинговые идеи каждый день. Ежедневные новости и инсайты — навык
  для вашего AI-агента. Принцип дня (Psyche) + Product Hunt + GitHub Trending
  (Extraction) + свежие рекламные кейсы (Radar) + кросс-синтез идей (Ideas).
  Создаёт 4 заметки в Obsidian/Tolaria vault за 5-7 минут.
  Запускай: "/daily-discovery", "запусти daily discovery", "дай маркетинг на сегодня".
---

# Daily Marketing Discovery Engine

Автоматизированный AI-пайплайн, который каждое утро собирает 4 маркетинговых инсайта
и сохраняет их в Obsidian-совместимый vault.

## Как это работает

```
┌─────────────────────────────────────────────────────────┐
│                    /daily-discovery                       │
├─────────────────────────────────────────────────────────┤
│  Psyche (60% ротация · 20% deep-dive · 10% внешний ·    │
│          10% discovery) → web search → заметка           │
├─────────────────────────────────────────────────────────┤
│  Extraction (Product Hunt + GitHub Trending)              │
│  → параллельный webfetch → дайджест + разбор             │
├─────────────────────────────────────────────────────────┤
│  Radar (LBBOnline · AdWeek · ContentGrip · web)          │
│  → 3-4 параллельных поиска → 4-6 кейсов с разбором      │
├─────────────────────────────────────────────────────────┤
│  Ideas (кросс-синтез Psyche ∩ Radar ∩ Extraction)        │
│  → 3-5 готовых гипотез под твои проекты                 │
└─────────────────────────────────────────────────────────┘
```

---

## ⚡ Быстрый старт

```bash
# 1. Склонируй
git clone https://github.com/your-username/daily-discovery.git

# 2. Установи скилл (автоматически)
cd daily-discovery
# Windows:
.\install.ps1
# Mac/Linux:
# chmod +x install.sh && ./install.sh

# 3. Укажи путь к vault
echo "TOLARIA_VAULT_PATH=C:/MyVault" > .env

# 4. Скажи OpenCode:
/daily-discovery
```

---

## Перед запуском

1. **Vault** — Obsidian или Tolaria vault. Если нет — создай пустую папку.
2. **OpenCode** — с плагином `oh-my-openagent`.
3. **Web search** — built-in или Exa MCP. Без него не будет Radar и свежих кейсов.
4. **.env** — файл с `TOLARIA_VAULT_PATH`. Если нет — скилл спросит при запуске.

---

## Шаг 1: Psyche — принцип дня

### Выбор принципа

Открой `{vault}/marketing-discovery/psyche/QUEUE.md`.

**Механика выбора** (прописана в frontmatter QUEUE.md):

| % | Pool | Что берём |
|---|---|---|
| 60% | A — ротация | Следующий unchecked `[ ]` принцип от 1 до 72 |
| 20% | B — deep-dive | Тот же принцип, новый контекст (B2B vs B2C, канал, индустрия) |
| 10% | C — внешний | Случайный принцип из POOL.md |
| 10% | D — discovery | Web search "new marketing psychology research 2026" → выбираем |

**Если Pool A:** найди первый `- [ ] N — Name` в QUEUE.md, отметь его `[x]`.
**Если Pool C:** зарандомь число от 1 до N (где N — размер POOL.md).

### Исследование

Сделай параллельно **2-3 web search запроса** по теме:
```
"{principle name}" marketing case study
"{principle name}" advertising example
"{principle name}" psychology research
```

### Формат заметки

Файл: `{vault}/marketing-discovery/psyche/{YYYY-MM-DD}-{principle-kebab}.md`

```markdown
---
type: Ежедневные открытия
date: YYYY-MM-DD
principle: "Name (Название)"
source: "Pool A rotation / Pool B deep-dive / Pool C external / Pool D discovery"
---

# Name — русское название

## Что это

2-3 абзаца простым языком: суть принципа, откуда он взялся,
почему он вообще работает (эволюция, нейробиология, когнитивистика).

## Почему это работает в маркетинге

- Связь с покупательским поведением
- На какие кнопки в мозге нажимает
- Исследования, которые это подтверждают (автор, год, кратко)

## Примеры из реальных кампаний

### Бренд / Компания
**Что сделали:** …
**Почему сработал принцип:** …
**Результат:** …

*Источник: [ссылка]*

(минимум 2-3 примера, каждый с ссылкой)

## Как применить сегодня

**Гипотеза 1:** …
**Гипотеза 2:** …
**Гипотеза 3:** …

## Когда не работает / ограничения

## Источники

- Исследование: Автор (год)
- Статья: …
- Кейс: …
```

**Верификация:** каждый пример — с реальной ссылкой. Нет ссылки — убери пример.

---

## Шаг 2: Extraction — Product Hunt + GitHub Trending

**Параллельно:**

### Product Hunt
1. `webfetch https://www.producthunt.com/` — топ дня
2. Если не грузится → web search "product hunt today {YYYY-MM-DD}"

### GitHub Trending
1. web search "github trending today {YYYY-MM-DD} repositories"
2. `webfetch https://github.com/trending`

### Формат заметки

Файл: `{vault}/marketing-discovery/extraction/{YYYY-MM-DD}-product-hunt.md`

```markdown
---
type: Ежедневные открытия
date: YYYY-MM-DD
sources: Product Hunt + GitHub Trending
---

# Дайджест — {DD Month YYYY}

## Product Hunt — топ дня

| # | Продукт | ↑ | Маркетинговый разбор |
|---|---|---|---|
| 1 | [Name](https://www.producthunt.com/products/{slug}) — tagline | N | … |
| ... |  |  |  |

Топ-10 с краткими инсайтами: почему продукт конвертит, что
сработало в позиционировании.

### Инсайты из Product Hunt
- Паттерны: какие категории доминируют
- Что работает в заголовках
- Что не работает

## GitHub Trending

| # | Репозиторий | Описание | ★/день | Всего ★ |
|---|---|---|---|---|
| 1 | [owner/repo](https://github.com/owner/repo) | … | +N | N |

### Инсайты из GitHub
- Тренды
- Ниши
- Что это значит для маркетинга

## Что попробовать сегодня
3-5 конкретных recommendations со ссылками
```

---

## Шаг 3: Radar — рекламные кейсы

**Параллельные поиски** (минимум 3-4):

```
site:lbbonline.com "campaign" 2026
site:adweek.com/creativity 2026
site:contentgrip.com 2026
"creative ad campaign" 2026 "case study"
```

Дополнительно (если нужно): TechCrunch, Muse by Clio, The Drum, D2C Times.

### Формат заметки

Файл: `{vault}/marketing-discovery/radar/{YYYY-MM-DD}-ad-radar.md`

```markdown
---
type: Ежедневные открытия
date: YYYY-MM-DD
sources: LBBOnline, AdWeek, ContentGrip, web search
---

# Ad Radar — {DD Month YYYY}

---

## N. Brand — Campaign Name

**Что:** 3-5 строк описания (каналы, механика, бюджет если есть)

**Психология:** какие биасы/принципы задействованы

**→ Что взять:** actionable вывод для своих проектов

[Source: Name](url)

---

```

**Критерии:**
- Минимум 4 кампании
- У каждой — ссылка на источник
- Для каждой указан психологический принцип (это создаёт связь с Psyche)

---

## Шаг 4: Ideas — кросс-синтез

Прочти все 3 заметки. Найди пересечения.

### Формат заметки

Файл: `{vault}/marketing-discovery/ideas/{YYYY-MM-DD}-cross-synthesis.md`

```markdown
---
type: Ежедневные открытия
date: YYYY-MM-DD
sources: psyche + radar + extraction
---

# Ideas — {DD Month YYYY}: {ключевая тема дня}

Кросс-синтез сегодняшних заметок.

## 🔗 Связь N — Название

**Psyche говорит:** …
**Radar показывает:** …
**Extraction подтверждает:** …

→ **Сигнал:** конкретный вывод для твоих проектов

---

## 🎯 Что попробовать завтра

1. **Название** — описание (с привязкой к источнику)
...
```

**Проверка:** каждая гипотеза должна быть привязана хотя бы к одной заметке дня.

---

## Шаг 5: Верификация

- [ ] Все 4 файла созданы в правильных папках vault
- [ ] У каждого есть frontmatter с `type: Ежедневные открытия`
- [ ] Psyche: 2-3 примера, у каждого ссылка
- [ ] Radar: 4-6 кампаний, у каждой источник + психология
- [ ] Ideas: минимум 3 связи между разными источниками
- [ ] Все ссылки рабочие

---

## Если пайплайн прервался

1. Проверь какие файлы уже созданы
2. Продолжи с того шага, где остановился
3. Если vault пуст — начни сначала

## Если нет доступа к источнику

- Product Hunt заблокирован → web search "product hunt top launches today"
- GitHub Trending не парсится → web search + `gh search repos --sort stars`
- Ad campaigns не находятся → расширь запросы, убери year filter

## Первый запуск

Если в vault нет `marketing-discovery/psyche/QUEUE.md` — создай его
из шаблона `templates/vault/marketing-discovery/psyche/QUEUE.md`.
То же для POOL.md.

---

## Переменные окружения

| Переменная | По умолчанию | Описание |
|---|---|---|
| `TOLARIA_VAULT_PATH` | `~/TOLARIA` | Путь к Obsidian/Tolaria vault |
| `TOLARIA_NOTES_DIR` | `marketing-discovery` | Папка для заметок внутри vault |
