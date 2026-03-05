#!/bin/sh
set -e

# 檢查必要環境變數
if [ -z "${GOOGLE_API_KEY}" ]; then
  echo "❌ ERROR: GOOGLE_API_KEY is not set"
  exit 1
fi

if [ -z "${TELEGRAM_BOT_TOKEN}" ]; then
  echo "❌ ERROR: TELEGRAM_BOT_TOKEN is not set"
  exit 1
fi

# 用 Python 做替換，避免 sed 跳脫字元問題
python3 -c "
import os, json

with open('/root/.nanobot/config.json', 'r') as f:
    content = f.read()

content = content.replace('\${GOOGLE_API_KEY}', os.environ['GOOGLE_API_KEY'])
content = content.replace('\${TELEGRAM_BOT_TOKEN}', os.environ['TELEGRAM_BOT_TOKEN'])

with open('/root/.nanobot/config.json', 'w') as f:
    f.write(content)

print('✅ config.json substitution done')
"

echo "🐈 Starting nanobot gateway on port 18790..."
exec nanobot gateway
