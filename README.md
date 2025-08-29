# SearXNG on Render

A lightweight, headless SearXNG search API optimized for cloud deployment. Provides privacy-respecting metasearch with JSON, CSV, RSS, and HTML output formats.

## Features

- ⚡ **API-First**: Designed for programmatic use with disabled rate limiting
- 📊 **Multiple Formats**: JSON, CSV, RSS, and HTML responses
- 🔧 **Resource Optimized**: Lightweight configuration with 1 worker, 2 threads
- 🚀 **Auto-Deployment**: One-click Render deployment with blueprint

## Quick Deploy

### Option 1: Render Blueprint (Recommended)

1. Fork this repository
2. Go to [Render Dashboard](https://dashboard.render.com)
3. Click **"New"** → **"Blueprint"**
4. Connect your GitHub account and select this repository
5. Click **"Apply Blueprint"** - deployment starts automatically

### Option 2: Manual Web Service

1. Fork this repository
2. Go to [Render Dashboard](https://dashboard.render.com)
3. Click **"New"** → **"Web Service"**
4. Connect your GitHub account and select this repository
5. Configure:
   - **Environment**: `Docker`
   - **Auto-Deploy**: Enable
6. Set environment variables:
   ```
   SEARXNG_SECRET=your-secret-here
   UWSGI_WORKERS=1
   UWSGI_THREADS=2
   ```
7. Click **"Create Web Service"**

## Configuration

### Environment Variables

- `SEARXNG_SECRET`: Random secret key (auto-generated in blueprint)
- `UWSGI_WORKERS`: Number of workers (default: 1)
- `UWSGI_THREADS`: Threads per worker (default: 2)
- `SEARXNG_BASE_URL`: Your Render service URL (optional)

### Files

- `settings.yml`: SearXNG configuration with API optimizations
- `uwsgi.ini`: Lightweight uWSGI configuration
- `docker-entrypoint.sh`: Entrypoint script for Render
- `Dockerfile`: Container build configuration
- `render.yaml`: One-click deployment blueprint

## API Usage

Replace `<your-service>` with your Render service URL:

```bash
# JSON response (recommended)
curl "https://<your-service>.onrender.com/search?q=openai&format=json"

# CSV format
curl "https://<your-service>.onrender.com/search?q=openai&format=csv"

# RSS feed
curl "https://<your-service>.onrender.com/search?q=openai&format=rss"

# HTML page
curl "https://<your-service>.onrender.com/search?q=openai&format=html"
```

### Query Parameters

- `q`: Search query (required)
- `format`: Output format (`json`, `csv`, `rss`, `html`)
- `categories`: Search categories (optional)
- `language`: Language code (optional)

## Important Notes

- ⚠️ **Cold Starts**: Cloud services may sleep after periods of inactivity
- 💾 **No Persistence**: Ephemeral deployment with no persistent disk storage
- 🔒 **Rate Limiting**: Disabled by default for API usage
- 🚀 **Health Check**: Available at `/about` endpoint

## License

MIT - See [LICENSE](LICENSE) file for details.
