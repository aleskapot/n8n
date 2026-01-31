FROM postgres:16

RUN apt-get update && \
    apt-get install -y postgresql-server-dev-16 make gcc git && \
    git clone --branch v0.7.2 https://github.com/pgvector/pgvector.git && \
    cd pgvector && \
    make && make install && \
    cd .. && rm -rf pgvector && \
    apt-get remove --purge -y git make gcc && \
    apt-get autoremove -y && \
    apt-get clean
