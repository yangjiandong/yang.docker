#! /bin/bash

docker run --rm -i -t \
  -v $(pwd)/works:/workspace \
  one/nvm /bin/bash
