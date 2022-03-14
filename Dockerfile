FROM cirss/repro-builder-base:latest

COPY .repro .repro
COPY .repro/exported/bootstrap .repro/
RUN bash .repro/bootstrap /.repro/exported

USER repro

# install the exported module containing the tests
RUN repro.require repro-builder exported --test --demo

# run the tests
RUN repro.atstart run_all_tests

CMD  /bin/bash -il
