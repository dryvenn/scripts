#!/usr/bin/env bash

set -o errexit
set -o errtrace
set -o nounset
set -o pipefail
#set -o xtrace

usage() {
	1>&2 cat <<- EOF
	Usage: > $(basename $0) <ip> [port]
	EOF
	exit 1
}
[ $# -lt 1 ] && usage
[ $# -gt 2 ] && usage

exec socat READLINE tcp:$1:${2:-23}
