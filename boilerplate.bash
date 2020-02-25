#!/usr/bin/env bash

set -o errexit
set -o errtrace
set -o nounset
set -o pipefail
#set -o xtrace

WD=$(pwd)
SD=$(dirname $(readlink -e $0))

log() {
	1>&2 echo "$@"
}

fatal() {
	test $# -eq 0 || log "$@"
	exit 255
}

usage() {
	1>&2 cat <<-EOF
	Usage: > $(basename $0) ...
	EOF
	exit 1
}
[ $# -ne 0 ] && usage

example=false
while [ $# -gt 0 ]
do
	case "$1" in
		--example)
			example=true
			shift
			;;
		-*)
			usage
			;;
		*)
			;;
	esac
done
