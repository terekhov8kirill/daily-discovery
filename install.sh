#!/bin/bash
# Daily Marketing Discovery — Unix Installer
# Запускай: chmod +x install.sh && ./install.sh

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "╔══════════════════════════════════════════╗"
echo "║   Daily Marketing Discovery — Install    ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# 1. Определяем куда ставить скилл
OPENCODE_GLOBAL="$HOME/.config/opencode/agents/skills"
OPENCODE_LOCAL="$REPO_DIR/.agents/skills"

if [ -d "$OPENCODE_GLOBAL" ]; then
    TARGET="$OPENCODE_GLOBAL"
    echo "→ OpenCode config found: $TARGET"
elif [ -d "$OPENCODE_LOCAL" ]; then
    TARGET="$OPENCODE_LOCAL"
    echo "→ Local .agents folder found: $TARGET"
else
    echo "→ OpenCode not found. Creating local .agents..."
    TARGET="$OPENCODE_LOCAL"
    mkdir -p "$TARGET"
fi

# 2. Copy skill
SKILL_SOURCE="$REPO_DIR/.agents/skills/daily-discovery"
SKILL_DEST="$TARGET/daily-discovery"

if [ -d "$SKILL_DEST" ]; then
    echo "→ Skill already installed. Updating..."
    rm -rf "$SKILL_DEST"
fi

cp -r "$SKILL_SOURCE" "$SKILL_DEST"
echo "✅ Skill installed: $SKILL_DEST"

# 3. Check .env
if [ ! -f "$REPO_DIR/.env" ]; then
    echo ""
    echo "⚠️  .env not found. Set vault path:"
    echo "   echo 'TOLARIA_VAULT_PATH=/path/to/vault' > .env"
    echo ""
    # Create from example if it exists
    if [ -f "$REPO_DIR/.env.example" ]; then
        cp "$REPO_DIR/.env.example" "$REPO_DIR/.env"
        echo "→ Created .env from .env.example — edit your vault path"
    fi
fi

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   Done! Run in OpenCode:                 ║"
echo "║                                          ║"
echo "║   /daily-discovery                       ║"
echo "║                                          ║"
echo "╚══════════════════════════════════════════╝"
