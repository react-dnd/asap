#!/bin/sh
set -e
npx tsc
npx babel --config-file=./babel.config.js lib --out-dir dist/esm &
npx babel --config-file=./babel.config.cjs.js lib --out-dir dist/cjs &
wait

if [ -f ./rollup.config.js ]
then
  npx rollup -c rollup.config.js
fi
