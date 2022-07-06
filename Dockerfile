FROM cirss/repro-parent:latest

COPY exports /repro/exports
RUN bash /repro/exports/setup /repro/exports

USER repro

# install the exported module containing the tests
RUN repro.require repro exports --demos --custom

RUN repro.service Blazegraph 9999 9999
RUN repro.service Jupyter 8888 8888

CMD  /bin/bash -il
