#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# You can add your customized environment variable on SCM, but all of them will
# be added a prefix `CUSTOM_`.
RUST_BUILD_MODE="${CUSTOM_RUST_BUILD_MODE:-}"

# If the environment variable is not set, use the first argument as the build
# mode.
if [ -z "${RUST_BUILD_MODE}" ]; then
	RUST_BUILD_MODE="${1:-release}"
fi

mkdir -p output/bin

cp bootstrap.sh output/

chmod +x output/bootstrap.sh

if [ "${RUST_BUILD_MODE}" = "debug" ]; then
	cargo build
	cp target/debug/server output/bin/
	echo "Built debug version"
else
	cargo build --release
	cp target/release/server output/bin/
	echo "Built release version"
fi
