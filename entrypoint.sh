#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Run the main container command (passed as CMD in Dockerfile)
exec "$@"

bundle exec rails db:migrate
bundle exec rails db:seed