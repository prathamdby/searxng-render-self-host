FROM searxng/searxng:latest

# Copy SearXNG configuration
COPY settings.yml /etc/searxng/settings.yml
COPY limiter.toml /etc/searxng/limiter.toml
COPY uwsgi.ini /etc/uwsgi.ini

# Point SearXNG to the settings file
ENV SEARXNG_SETTINGS_PATH=/etc/searxng/settings.yml

# Lightweight entrypoint that binds to Render's $PORT and tunes uWSGI
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8080

CMD ["docker-entrypoint.sh"]