FROM cirss/repro-base:latest

COPY .repro .repro
#ADD https://github.com/repros-dev/repro-builders/releases/download/v0.1.0/build .repro/
RUN bash .repro/build

USER repro

# URLs for REPRO modules delivered as CIRSS GitHub releases
ENV CIRSS_RELEASES 'https://github.com/cirss/${1}/releases/download/v${2}/'

# install the exported module containing the tests
RUN repro.require repro-builders exported ${CIRSS_RELEASES}

# run the tests
RUN repro.atstart run_tests

CMD  /bin/bash -il
