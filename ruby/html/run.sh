#! /bin/bash

docker run --rm -i -t \
  -v $(pwd):/workspace \
  one/html /bin/bash
