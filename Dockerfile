ARG POSTGRES_VERSION

FROM postgres:${POSTGRES_VERSION}

RUN apt-get update \
    && apt-get install -y git make gcc postgresql-server-dev-15 \
    && rm -rf /var/lib/apt/lists/*

ARG PGVECTOR_VERSION

RUN cd /tmp \
    && git clone --branch v${PGVECTOR_VERSION} https://github.com/pgvector/pgvector.git \
    && cd pgvector \
    && make \
    && make install \
    && cd /tmp \
    && rm -rf /tmp/pgvector
