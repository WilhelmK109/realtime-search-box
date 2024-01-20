#!/usr/bin/env bash
# exit on error
set -o errexit

chmod +x bin/rails

bundle install
./bin/rails assets:precompile
./bin/rails assets:clean