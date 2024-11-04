ARG POSTGRES_VERSION

FROM postgres:${POSTGRES_VERSION}-alpine

RUN apk add --no-cache \
    git make gcc clang15 llvm15 musl-dev

ARG HYPOPG_VERSION

RUN cd /tmp \
    && git clone --branch ${HYPOPG_VERSION} https://github.com/HypoPG/hypopg.git \
    && cd hypopg \
    && make \
    && make install \
    && cd /tmp \
    && rm -rf /tmp/hypopg

ARG PGVECTOR_VERSION

RUN cd /tmp \
    && git clone --branch v${PGVECTOR_VERSION} https://github.com/pgvector/pgvector.git \
    && cd pgvector \
    && make \
    && make install \
    && cd /tmp \
    && rm -rf /tmp/pgvector
