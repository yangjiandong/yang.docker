#! /bin/bash

docker run --rm -i -t \
  -v $(pwd)/works:/workspace \
  one/relaxedjs:10.15-alpine /bin/bash
