#!/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2025 Roman Koch <koch.romam@gmail.com>

docker build -t ghcr.io/emblincram/boxy:latest .

echo "${CR_PAT}" | docker login ghcr.io -u emblincram --password-stdin
docker push ghcr.io/emblincram/boxy:latest

