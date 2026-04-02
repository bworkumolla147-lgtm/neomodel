FROM python:3.9-slim

WORKDIR /app

# Install test deps + package deps
COPY setup.py setup.cfg README.rst ./
COPY neomodel/ ./neomodel/
COPY scripts/ ./scripts/
COPY test/ ./test/
# (If your repo uses a different test folder name, keep it consistent.)

RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir . && \
    pip install --no-cache-dir pytest shapely

# Default: run tests. (Platform may provide Neo4j; README shows NEO4J_BOLT_URL.)
ENV NEO4J_BOLT_URL=bolt://neo4j:neo4j@localhost:7687
CMD ["pytest", "-q"]