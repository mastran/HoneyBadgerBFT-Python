#!/bin/bash

pip install --upgrade pip

# will not be needed for flake8
git clone https://github.com/JHUISI/charm.git
cd charm && ./configure.sh && make install
cd ..

if [ "${BUILD}" == "tests" ]; then
    pip install -e .[test]
    pip install --upgrade codecov
elif [ "${BUILD}" == "flake8" ]; then
    pip install flake8
elif [ "${BUILD}" == "docs" ]; then
    pip install -e .[docs]
fi
