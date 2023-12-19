ARG POSTGRES_VERSION

FROM cimg/postgres:${POSTGRES_VERSION}

ARG PGVECTOR_VERSION

RUN cd /tmp \
    && git clone --branch v${PGVECTOR_VERSION} https://github.com/pgvector/pgvector.git \
    && cd pgvector \
    && make \
    && make install \
    && cd /tmp \
    && rm -rf /tmp/pgvector
