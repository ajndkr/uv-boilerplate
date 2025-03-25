FROM python:3.12-slim

# install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# required to use uv managed virtualenv
ENV PATH="/app/.venv/bin:$PATH"

ADD . /app
WORKDIR /app

# install dependencies without updating the lock file
RUN uv sync --frozen --no-cache --compile-bytecode

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
