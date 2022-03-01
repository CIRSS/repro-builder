FROM ubuntu:22.04

COPY .repro .repro
#ADD https://github.com/CIRSS/repro-builder/releases/download/v0.1.0/bootstrap .repro/
RUN bash .repro/bootstrap

USER repro

# URLs for REPRO modules delivered as CIRSS GitHub releases
ENV CIRSS_RELEASES 'https://github.com/cirss/${1}/releases/download/v${2}/'

# install the local module containing the tests
RUN repro.install repro-builder local ${CIRSS_RELEASES}

# run the tests
RUN repro.atstart run_tests.sh

CMD  /bin/bash -il
