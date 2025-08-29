# SearXNG on Render (Free Tier) – Headless Search API

This repo configures SearXNG to run on Render's free tier as a lightweight, headless web search API.

## What you get

- Disabled rate limiting (`server.limiter: false`)
- All formats enabled: `json`, `csv`, `rss`, `html`
- Lean uWSGI: 1 worker, 2 threads
- Binds to `$PORT` automatically

## Deploy on Render

- Use the included `render.yaml` (Blueprint) or create a Web Service from this repo (environment: Docker).
- Env vars (pre-set in Blueprint):
  - `SEARXNG_SECRET`: generated at deploy (set your own for consistency).
  - `UWSGI_WORKERS`: `1`
  - `UWSGI_THREADS`: `2`
- Optional: set `SEARXNG_BASE_URL` to your public Render URL after first deploy.

## API usage

- JSON: `GET https://<service>.onrender.com/search?q=openai&format=json`
- CSV: `GET https://<service>.onrender.com/search?q=openai&format=csv`
- RSS: `GET https://<service>.onrender.com/search?q=openai&format=rss`
- HTML: `GET https://<service>.onrender.com/search?q=openai&format=html`

## Files

- `settings.yml` – disables limiter, enables formats, safe defaults.
- `uwsgi.ini` – tuned for low memory/CPU.
- `docker-entrypoint.sh` – binds to `$PORT`, launches uWSGI.
- `Dockerfile` – assembles image from `searxng/searxng`.
- `render.yaml` – one‑click Render Blueprint.

Notes: Render free services sleep after ~15 min idle (cold start). Free tier has no persistent disk.
