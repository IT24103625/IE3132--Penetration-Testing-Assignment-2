FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    coreutils \
    grep \
    gawk \
    findutils \
    file \
    binutils \
    python3 \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /challenge

CMD ["/bin/bash"]