#!/usr/bin/env sh
set -eu

# Defaults suitable for Render free tier
PORT="${PORT:-8080}"
UWSGI_WORKERS="${UWSGI_WORKERS:-1}"
UWSGI_THREADS="${UWSGI_THREADS:-2}"

# Ensure SearXNG uses our settings unless overridden
export SEARXNG_SETTINGS_PATH="${SEARXNG_SETTINGS_PATH:-/etc/searxng/settings.yml}"

exec uwsgi \
  --http ":${PORT}" \
  --module searx.webapp:application \
  --ini /etc/uwsgi.ini \
  --master \
  --processes "${UWSGI_WORKERS}" \
  --threads "${UWSGI_THREADS}" \
  --die-on-term

