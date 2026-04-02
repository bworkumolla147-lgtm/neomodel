FROM python:3.10-slim

WORKDIR /app

COPY pyproject.toml README.md requirements.txt requirements-dev.txt ./
COPY neomodel/ ./neomodel/
COPY test/ ./test/
COPY bin/ ./bin/
COPY docker-scripts/ ./docker-scripts/

RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements-dev.txt

ENV NEO4J_BOLT_URL=bolt://neo4j:neo4j@localhost:7687
CMD ["pytest", "-q"]

