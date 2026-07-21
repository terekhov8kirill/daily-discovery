<div align="center">
  <h1>🧠📡 Daily Marketing Discovery</h1>
  <p><strong>Маркетинговые идеи каждый день</strong><br>
  Ежедневные новости и инсайты — навык для вашего AI-агента</p>
  <p>Запускается одной фразой в OpenCode. Работает за 5-7 минут.</p>
  <p>
    <a href="#-как-это-выглядит">Скриншоты</a> •
    <a href="#-установка">Установка</a> •
    <a href="#-пайплайн">Пайплайн</a> •
    <a href="#-кастомизация">Кастомизация</a>
  </p>
  <p>
    <img src="https://img.shields.io/badge/license-MIT-green" alt="MIT">
    <img src="https://img.shields.io/badge/OpenCode-plugin-blue" alt="OpenCode">
    <img src="https://img.shields.io/badge/Tolaria-ready-orange" alt="Tolaria">
  </p>
</div>

---

## 🤔 Что это

Автоматизированный AI-агент, который каждое утро:

1. **Изучает один маркетинговый принцип** — из очереди 73 принципов (First Principles, Anchoring, Scarcity...)
2. **Парсит Product Hunt и GitHub Trending** — что в топе, какие паттерны
3. **Находит 4-6 свежих рекламных кампаний** — реальные кейсы с психологическим разбором
4. **Синтезирует всё в 3-5 гипотез** — готовые идеи под твои проекты

Всё сохраняется в Obsidian/Tolaria vault в папку `marketing-discovery/`.

---

## 🖼 Как это выглядит

После запуска `/daily-discovery` в vault появляются 4 заметки:

```
marketing-discovery/
├── psyche/
│   └── 2026-07-21-first-principles.md    ← Принцип дня
│       • First Principles — мыслить с нуля
│       • Примеры: SpaceX, Dollar Shave Club
│       • 3 гипотезы для применения
│
├── extraction/
│   └── 2026-07-21-product-hunt.md        ← Рынок
│       • Lev8 (↑297), CartAI (↑256), Rerun (↑193)
│     	• GitHub: ai-agent-book (+4,434★/день)
│       • Паттерны: AI доминирует, open source растёт
│
├── radar/
│   └── 2026-07-21-ad-radar.md            ← Кейсы
│       • Powerball UK — аспирация + финал ЧМ
│       • OpenAI — пользователи на билбордах
│       • MLS — бесплатные билеты после ЧМ
│       • Amazon × Reacher — IP-фузия
│
└── ideas/
    └── 2026-07-21-cross-synthesis.md     ← Идеи
        • First Principles в реальных кампаниях
        • Пользователь как медиа
        • Культурный тайминг как суперсила
```

---

## ⚡ Установка

### Требования

- [OpenCode](https://opencode.ai) с плагином `oh-my-openagent`
- Obsidian/Tolaria vault (или просто папка для заметок)
- Доступ к web search (built-in или [Exa MCP](https://exa.ai))

### 1. Склонируй

```bash
git clone https://github.com/terekhov8kirill/daily-discovery.git
cd daily-discovery
```

### 2. Установи скилл

**Windows:**
```powershell
.\install.ps1
```

**Mac / Linux:**
```bash
chmod +x install.sh && ./install.sh
```

Скрипт сам найдёт OpenCode и скопирует скилл в нужное место.

**Вручную** (если не сработало):
```bash
# Глобально (доступно из любого проекта)
cp -r .agents/skills/daily-discovery ~/.config/opencode/agents/skills/

# Локально (только для этого проекта)
cp -r .agents/skills/daily-discovery .agents/skills/
```

### 3. Настрой vault

Создай `.env` в корне проекта:

```bash
echo "TOLARIA_VAULT_PATH=C:/МойObsidianVault" > .env
```

Если vault нет — создай пустую папку. При первом запуске скилл создаст нужную структуру.

> **Windows**: используй `/` вместо `\`. Пример: `C:/Users/me/vault`

### 4. Запусти

Перезапусти OpenCode и скажи:

```
/daily-discovery
```

или

```
запусти daily discovery
```

или просто:

```
дай маркетинг на сегодня
```

---

## ⚙️ Пайплайн

```
╔══════════════════════════════════════════════════════════╗
║                    /daily-discovery                       ║
╠══════════════════════════════════════════════════════════╣
║                                                          ║
║  Шаг 1: PSYCHE (принцип дня)                             ║
║  ┌──────────────────────────────────────────────────┐    ║
║  │ 60% Pool A — ротация (очередь 1→73)              │    ║
║  │ 20% Pool B — deep-dive (новый контекст)          │    ║
║  │ 10% Pool C — внешний (из POOL.md)                │    ║
║  │ 10% Pool D — discovery (web search)               │    ║
║  └──────────────────────────────────────────────────┘    ║
║    ↓ web search 2-3 запроса                              ║
║    ↓ заметка с примерами + источниками                   ║
║                                                          ║
║  Шаг 2: EXTRACTION (Product Hunt + GitHub Trending)      ║
║    ↓ параллельные webfetch                               ║
║    ↓ дайджест + маркетинговый разбор                      ║
║                                                          ║
║  Шаг 3: RADAR (свежие рекламные кейсы)                   ║
║    ↓ 3-4 параллельных поиска                             ║
║    ↓ 4-6 кампаний с психологическим разбором              ║
║                                                          ║
║  Шаг 4: IDEAS (кросс-синтез)                              ║
║    ↓ Psyche ∩ Radar ∩ Extraction                         ║
║    ↓ 3-5 готовых гипотез под твои проекты                ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝
```

---

## 🧠 Что внутри

### Psyche — маркетинговые принципы

73 принципа, разбитые на 6 групп:

| Группа | Принципы | Примеры |
|---|---|---|
| Foundational Thinking | 1-14 | First Principles, JTBD, Pareto |
| Buyers & Psychology | 15-36 | Social Proof, Sunk Cost, Lindy |
| Persuasion | 37-49 | Reciprocity, Anchoring, Framing |
| Pricing | 50-55 | Charm Pricing, Decoy Effect |
| Design & Delivery | 56-65 | Hick's Law, Nudge, AIDA |
| Growth & Scaling | 66-73 | Network Effects, Flywheel |

Плюс 24 внешних принципа (Pool C): Halo Effect, Pre-suasion, Dark Patterns, etc.

### Extraction — Product Hunt + GitHub

Что в топе, какие паттерны, что работает в позиционировании.

### Radar — реальные кейсы

Откуда берём:
- **LBBOnline** — главный источник креативных кампаний
- **AdWeek Creativity** — разборы с бюджетом и результатами
- **ContentGrip** — быстрые обзоры
- **Muse by Clio** — награды и кейсы
- Web search — для свежести

### Ideas — синтез

Не просто сумма 3 заметок, а поиск пересечений:
- Какой принцип из Psyche сработал в кампаниях из Radar?
- Что рынок (Extraction) говорит про этот принцип?
- → Конкретная гипотеза под твои проекты

---

## 🎛 Кастомизация

### Добавить свои источники для Radar

Править `references/radar-sources.md` — добавить URL блогов, твиттер-аккаунтов.

### Добавить свои принципы

Править `QUEUE.md` и `POOL.md` внутри vault.

### Сменить вероятности выбора

В `QUEUE.md` во frontmatter:

```yaml
_pick_strategy: |
  70% — next from rotation
  10% — deep-dive
  10% — external
  10% — discovery
```

### Другие форматы заметок

Скилл использует markdown. Любой инструмент, работающий с .md, подойдёт — Obsidian, Tolaria, Notion (через импорт), Logseq.

---

## 📂 Структура репо

```
daily-discovery/
├── .agents/
│   └── skills/daily-discovery/       ← Скилл для OpenCode
│       ├── SKILL.md                   ← Команда /daily-discovery
│       └── references/
│           ├── radar-sources.md       ← Источники для поиска
│           ├── psyche-queue.md        ← 73 принципа справочно
│           └── troubleshooting.md     ← Решения проблем
├── templates/vault/                   ← Шаблоны для нового vault
│   └── marketing-discovery/psyche/
│       ├── QUEUE.md                   ← Трекер очереди
│       └── POOL.md                    ← Внешние принципы
├── install.ps1                        ← Установщик (Windows)
├── install.sh                         ← Установщик (Mac/Linux)
├── .env.example                       ← Шаблон конфига
├── LICENSE                            ← MIT
└── README.md                          ← Этот файл
```

---

## 🤝 Для кого

- **Маркетологам** — узнавать новое каждый день без тонны подписок
- **Продуктовым менеджерам** — искать неочевидные инсайты
- **Фаундерам** — быть в курсе рынка за 5 минут в день
- **Командам** — внедрить AI-агента в маркетинговые процессы

## 🙏 Благодарности и использованные проекты

Этот навык использует и опирается на следующие открытые проекты:

**[Sisyphus](https://opencode.ai)** (я) — главный оркестратор этого пайплайна. Собираю всё воедино, делегирую задачи субагентам, проверяю качество. На DeepSeek V4 Flash Free, но без фанатизма.

**[OpenCode](https://opencode.ai)** — AI-агентная среда выполнения. Вся магия происходит внутри неё.

**[oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent)** — плагин для OpenCode, который даёт навыки (skills), команды, субагентов и систему оркестрации. Без него не было бы ни `/daily-discovery`, ни скиллов.

**[Tolaria](https://tolaria.md)** — Obsidian-совместимое приложение для заметок. Все инсайты сохраняются в Tolaria vault, но подойдёт любой Obsidian-совместимый инструмент.

**[marketing-psychology skill](https://github.com/hosseinmirzapur/opencode-skills/tree/main/skills/marketing-psychology)** — источник 72 принципов маркетинговой психологии, которые составляют основу Psyche-очереди. Устанавливается через OpenCode skills.

**[last30days skill](https://github.com/mvanhorn/last30days-skill)** — поиск того, что люди реально обсуждают прямо сейчас (Reddit, X, YouTube, TikTok, HN). Используется для Pool D (discovery-режим Psyche).

**[agent-reach skill](https://github.com/Panniantong/Agent-Reach)** — доступ к 17 платформам через CLI. Потенциально используется для поиска обсуждений кампаний в соцсетях.

**[Cognitive Bias Codex](https://www.visualcapitalist.com/every-single-cognitive-bias/)** — основа для 24 внешних принципов в Pool C (POOL.md).

**[LBBOnline](https://lbbonline.com)**, **[AdWeek](https://www.adweek.com/creativity)**, **[ContentGrip](https://www.contentgrip.com)**, **[Muse by Clio](https://musebycl.io)** — источники свежих рекламных кейсов для Radar.

**[Product Hunt](https://www.producthunt.com)** и **[GitHub Trending](https://github.com/trending)** — источники данных для Extraction.

Благодарность каждому из этих проектов за то, что делают маркетинг и разработку лучше. Если ваш проект используется здесь и не указан — откройте issue, мы добавим.

## 📜 Лицензия

MIT — делай что хочешь, делись с друзьями, форкай, улучшай, продавай.

---

<div align="center">
  <p>Сделано с ❤️ и 🧠 для маркетологов, которые не хотят тупеть</p>
  <p>
    <a href="https://github.com/terekhov8kirill/daily-discovery/issues">Сообщить о проблеме</a> •
    <a href="https://github.com/terekhov8kirill/daily-discovery/discussions">Обсудить</a>
  </p>
</div>
