#!/usr/bin/env bash

set -o errexit
set -o errtrace
set -o nounset
set -o pipefail
# set -o xtrace

WD=$(pwd)
SD=$(dirname $(readlink -e $0))

err() {
	1>&2 echo "$*"
}

usage() {
	1>&2 cat <<- EOF
	Usage: > $(basename $0) ...
	EOF
	exit 1
}
[ $# -ne 0 ] && usage
