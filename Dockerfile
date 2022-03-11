FROM cirss/repro-base:latest

COPY .repro .repro
COPY .repro/exported/bootstrap .repro/
RUN bash .repro/bootstrap /.repro/exported

USER repro

# install the exported module containing the tests
RUN repro.require repro-builders exported -test

# run the tests
RUN repro.atstart run_all_tests

CMD  /bin/bash -il
