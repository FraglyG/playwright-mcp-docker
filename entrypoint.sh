#!/bin/sh
set -e

# Defaults
MCP_PORT=${PORT:-8931}
MCP_VERSION=${VERSION:-latest}

# Build arguments array
set -- "--port" "$MCP_PORT" "$@"

# Boolean flags
if [ "$HEADLESS" = "true" ]; then
  set -- "--headless" "$@"
fi

if [ "$ISOLATED" = "true" ]; then
  set -- "--isolated" "$@"
fi

if [ "$BLOCK_SERVICE_WORKERS" = "true" ]; then
  set -- "--block-service-workers" "$@"
fi

if [ "$IGNORE_HTTPS_ERRORS" = "true" ]; then
  set -- "--ignore-https-errors" "$@"
fi

if [ "$NO_SANDBOX" = "true" ]; then
  set -- "--no-sandbox" "$@"
fi

if [ "$SAVE_TRACE" = "true" ]; then
  set -- "--save-trace" "$@"
fi

if [ "$VISION" = "true" ]; then
  set -- "--vision" "$@"
fi

# String/value options
if [ -n "$ALLOWED_ORIGINS" ]; then
  set -- "--allowed-origins" "$ALLOWED_ORIGINS" "$@"
fi

if [ -n "$BLOCKED_ORIGINS" ]; then
  set -- "--blocked-origins" "$BLOCKED_ORIGINS" "$@"
fi

if [ -n "$BROWSER" ]; then
  set -- "--browser" "$BROWSER" "$@"
fi

if [ -n "$BROWSER_AGENT" ]; then
  set -- "--browser-agent" "$BROWSER_AGENT" "$@"
fi

if [ -n "$CAPS" ]; then
  set -- "--caps" "$CAPS" "$@"
fi

if [ -n "$CDP_ENDPOINT" ]; then
  set -- "--cdp-endpoint" "$CDP_ENDPOINT" "$@"
fi

if [ -n "$CONFIG" ]; then
  set -- "--config" "$CONFIG" "$@"
fi

if [ -n "$DEVICE" ]; then
  set -- "--device" "$DEVICE" "$@"
fi

if [ -n "$EXECUTABLE_PATH" ]; then
  set -- "--executable-path" "$EXECUTABLE_PATH" "$@"
fi

if [ -n "$HOST" ]; then
  set -- "--host" "$HOST" "$@"
fi

if [ -n "$IMAGE_RESPONSES" ]; then
  set -- "--image-responses" "$IMAGE_RESPONSES" "$@"
fi

if [ -n "$OUTPUT_DIR" ]; then
  set -- "--output-dir" "$OUTPUT_DIR" "$@"
fi

if [ -n "$PROXY_BYPASS" ]; then
  set -- "--proxy-bypass" "$PROXY_BYPASS" "$@"
fi

if [ -n "$PROXY_SERVER" ]; then
  set -- "--proxy-server" "$PROXY_SERVER" "$@"
fi

if [ -n "$STORAGE_STATE" ]; then
  set -- "--storage-state" "$STORAGE_STATE" "$@"
fi

if [ -n "$USER_AGENT" ]; then
  set -- "--user-agent" "$USER_AGENT" "$@"
fi

if [ -n "$USER_DATA_DIR" ]; then
  set -- "--user-data-dir" "$USER_DATA_DIR" "$@"
fi

if [ -n "$VIEWPORT_SIZE" ]; then
  set -- "--viewport-size" "$VIEWPORT_SIZE" "$@"
fi

# Start
npx @playwright/mcp@${MCP_VERSION} "$@"
