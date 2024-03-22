#!/usr/bin/env bash
docker run -e USER_UID=1000 -e USER_GID=1000 --rm -it preprocessor:da9d5068a583ec948655da629133e850bebe0104f073471b260f0e17f5b01e99 bash
