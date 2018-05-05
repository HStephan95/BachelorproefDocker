#! /usr/bin/bash
# abort on nonzero exitstatus
set -o errexit
# abort on unbound variable
set -o nounset
# don't mask errors in piped commands
set -o pipefail

# Required images
echo "Pulling images"

# MSSQL image 
docker pull microsoft/mssql-server-linux

# .NET image
docker pull microsoft/dotnet:2.0.5-sdk-2.1.4