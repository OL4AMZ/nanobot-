#!/bin/sh
# 用環境變數替換 config.json 裡的佔位符
sed -i "s|\${GEMINI_API_KEY}|${GEMINI_API_KEY}|g" /root/.nanobot/config.json
sed -i "s|\${TELEGRAM_BOT_TOKEN}|${TELEGRAM_BOT_TOKEN}|g" /root/.nanobot/config.json

# 啟動 nanobot gateway
exec nanobot gateway
