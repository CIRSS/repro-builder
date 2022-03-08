FROM cirss/repro-base:latest

COPY .repro .repro
#ADD https://github.com/CIRSS/repro-builder/releases/download/v0.1.0/build .repro/
RUN bash .repro/build

USER repro

# URLs for REPRO modules delivered as CIRSS GitHub releases
ENV CIRSS_RELEASES 'https://github.com/cirss/${1}/releases/download/v${2}/'

# install the exported module containing the tests
RUN repro.require repro-builder exported ${CIRSS_RELEASES}

RUN repro.prefixpath /foo
RUN repro.prefixpath /bar

# run the tests
RUN repro.atstart run_tests

CMD  /bin/bash -il
