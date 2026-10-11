FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    steghide \
    libimage-exiftool-perl \
    file \
    binutils \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /challenge

CMD ["/bin/bash"]