FROM cirss/repro-parent:latest

COPY exports /repro/exports
RUN bash /repro/exports/boot-setup /repro/exports

USER repro

# install the exported module containing the tests
RUN repro.require repro exports --demo --custom

RUN repro.service foo 100 200

CMD  /bin/bash -il
