FROM ubuntu:22.04

ENV REPRO_NAME  repro-builder
COPY .repro-builder .repro-builder
RUN bash .repro-builder/bootstrap

USER repro

# URLs for packages delivered as CIRSS GitHub releases
ENV CIRSS_RELEASES 'https://github.com/cirss/${1}/releases/download/v${2}/'

# install the local package containing the tests
RUN repro.install repro-builder local ${CIRSS_RELEASES}

# run the tests
RUN repro.atstart run_tests.sh

CMD  /bin/bash -il
