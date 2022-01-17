#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 -U test pdata <<-EOSQL
    CREATE DATABASE pdata2;
EOSQL
