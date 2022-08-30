#!/bin/bash

source ${REPRO_FUNCTIONS}

$_REPRO_INFO_ "Running all tests"

jq --version

$_REPRO_ALERT_ All Tests Succeeded
