#!/usr/bin/env bash

set -e

if [[ $PARALLEL == 'true' ]]; then
    export XTRATESTARGS="-n4 $XTRATESTARGS"
fi

if [[ $COVERAGE == 'true' ]]; then
    export XTRATESTARGS="--cov=dask --cov-report=xml $XTRATESTARGS"
fi

echo "py.test dask/dataframe/tests/test_multi.py::test_concat_categorical --runslow $XTRATESTARGS"
py.test dask/dataframe/tests/test_multi.py::test_concat_categorical --runslow $XTRATESTARGS

set +e
