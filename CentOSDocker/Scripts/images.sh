#! /usr/bin/bash
# abort on nonzero exitstatus
set -o errexit
# abort on unbound variable
set -o nounset
# don't mask errors in piped commands
set -o pipefail

docker pull microsoft/mssql-server-linux

docker pull microsoft/dotnet:2.0.5-sdk-2.1.4