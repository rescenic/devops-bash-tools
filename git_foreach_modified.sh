#!/usr/bin/env bash
# shellcheck disable=SC2230
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2020-06-02 19:54:09 +0100 (Tue, 02 Jun 2020)
#
#  https://github.com/harisekhon/bash-tools
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help improve or steer this or other code I publish
#
#  https://www.linkedin.com/in/harisekhon
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x
srcdir="$(cd "$(dirname "$0")" && pwd)"

# access to useful functions and aliases
# shellcheck disable=SC1090
. "$srcdir/.bash.d/aliases.sh"
#
# shellcheck disable=SC1090
. "$srcdir/.bash.d/functions.sh"
#
# shellcheck disable=SC1090
. "$srcdir/.bash.d/git.sh"

for filename in $(git status --porcelain | awk '/^.M/{print $NF}'); do
    "$@" "$filename"
done
