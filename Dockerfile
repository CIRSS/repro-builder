FROM cirss/repro-parent:latest

COPY exports /repro/exports
RUN bash /repro/exports/setup /repro/exports

USER repro

# install the exported module containing the tests
# RUN repro.require repro exports --code --demo --custom

CMD  /bin/bash -il
