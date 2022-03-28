FROM cirss/repro-base:latest

COPY exports /repro/exports
RUN bash /repro/exports/setup-boot

USER repro

# install the exported module containing the tests
RUN repro.require repro exports --test --demo

# run the tests
RUN repro.atstart run_all_tests

CMD  /bin/bash -il
