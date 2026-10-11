FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --create-home --shell /bin/bash analyst \
    && mkdir -p /opt/pulselock/evidence/logs /opt/pulselock/evidence/system /opt/pulselock/evidence/files /srv/research

COPY evidence/logs/auth.log /opt/pulselock/evidence/logs/auth.log
COPY evidence/system/cron.txt /opt/pulselock/evidence/system/cron.txt
COPY evidence/system/services.txt /opt/pulselock/evidence/system/services.txt
COPY evidence/system/file_metadata.txt /opt/pulselock/evidence/system/file_metadata.txt
COPY evidence/files/research_archive.txt /opt/pulselock/evidence/files/research_archive.txt
COPY evidence/files/archive.flag /srv/research/archive.flag
COPY container/verify-investigation.sh /usr/local/sbin/verify-investigation

RUN chown root:root /srv/research/archive.flag /usr/local/sbin/verify-investigation \
    && chmod 600 /srv/research/archive.flag \
    && chmod 755 /usr/local/sbin/verify-investigation \
    && printf '%s\n' 'analyst ALL=(root) NOPASSWD: /usr/local/sbin/verify-investigation' > /etc/sudoers.d/pl5-investigation \
    && chmod 440 /etc/sudoers.d/pl5-investigation \
    && visudo -cf /etc/sudoers.d/pl5-investigation \
    && chown -R root:root /opt/pulselock/evidence \
    && chmod -R a=rX /opt/pulselock/evidence

WORKDIR /opt/pulselock/evidence
USER analyst
CMD ["/bin/bash"]
