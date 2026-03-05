#!/bin/sh

# Debug：印出環境變數是否有值
echo ">>> GOOGLE_API_KEY=${GOOGLE_API_KEY}"
echo ">>> TELEGRAM_BOT_TOKEN=${TELEGRAM_BOT_TOKEN}"

# 替換佔位符
sed -i "s|\${GOOGLE_API_KEY}|${GOOGLE_API_KEY}|g" /root/.nanobot/config.json
sed -i "s|\${TELEGRAM_BOT_TOKEN}|${TELEGRAM_BOT_TOKEN}|g" /root/.nanobot/config.json

# Debug：印出替換後的 config
echo ">>> config.json after replace:"
cat /root/.nanobot/config.json

# 啟動
exec nanobot gateway
