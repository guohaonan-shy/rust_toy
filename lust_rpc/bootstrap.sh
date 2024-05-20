#!/usr/bin/env bash

set -o errexit
set -o pipefail

CURDIR="$(cd $(dirname $0); pwd)"
RUNTIME_ROOT="${1:-${CURDIR}}"

if [ "${IS_TCE_DOCKER_ENV}" = "1" ] && [ -n "${RUNTIME_LOGDIR}" ]; then
	RUNTIME_LOG_ROOT="${RUNTIME_LOGDIR}"
else
	RUNTIME_LOG_ROOT="${RUNTIME_ROOT}/log"
fi

mkdir -p "${RUNTIME_LOG_ROOT}/app"
mkdir -p "${RUNTIME_LOG_ROOT}/rpc"

export LUST_RUNTIME_ROOT="${RUNTIME_ROOT}"
export RUST_LOG_DIR="${RUNTIME_LOG_ROOT}"
export RUST_LOG="${RUST_LOG:-INFO}"
export RUST_MIN_STACK="$(echo $[0x2000000])"

if [ -n "${MY_CPU_LIMIT}" ] && [ -z "${TOKIO_WORKER_THREADS}" ]; then
	export TOKIO_WORKER_THREADS="${MY_CPU_LIMIT}"
fi

exec "${CURDIR}/bin/server"
