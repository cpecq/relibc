#!/usr/bin/env bash

set -e

if [[ "$(cargo install --list | grep '^redoxer ')" != "redoxer "* ]]
then
    cargo install redoxer
fi

if [ ! -d "$HOME/.redoxer/toolchain" ]
then
    redoxer toolchain
fi

export CARGO_TEST="redoxer"
export TEST_RUNNER="redoxer exec --folder . -- sh --"
redoxer env make "$@"