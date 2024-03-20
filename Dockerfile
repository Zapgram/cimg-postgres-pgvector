ARG POSTGRES_VERSION

FROM postgres:${POSTGRES_VERSION}-alpine

RUN apk add --no-cache \
    git make gcc clang15 llvm15 musl-dev

ARG PGVECTOR_VERSION

# We need to keep old versions of pgvector available for migration scripts
RUN for version in 0.5.0; do \
    cd /tmp \
    && git clone --branch v${version} https://github.com/pgvector/pgvector.git \
    && cd pgvector \
    && make \
    && make install \
    && cd /tmp \
    && rm -rf /tmp/pgvector; \
    done

# Install the specified version
RUN cd /tmp \
    && git clone --branch v${PGVECTOR_VERSION} https://github.com/pgvector/pgvector.git \
    && cd pgvector \
    && make \
    && make install \
    && cd /tmp \
    && rm -rf /tmp/pgvector
