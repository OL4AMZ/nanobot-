#!/bin/sh
set -e

sed -i "s|\${GOOGLE_API_KEY}|${GOOGLE_API_KEY}|g" /root/.nanobot/config.json
sed -i "s|\${TELEGRAM_BOT_TOKEN}|${TELEGRAM_BOT_TOKEN}|g" /root/.nanobot/config.json

echo "🐈 Starting nanobot gateway on port 18790..."
exec nanobot gateway
