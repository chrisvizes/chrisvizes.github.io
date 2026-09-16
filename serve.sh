#!/usr/bin/env bash
#
# Run the blog locally.
#
#   ./serve.sh              http://127.0.0.1:4000
#   ./serve.sh --port 4001  somewhere else
#
# macOS ships Ruby 2.6, which is too old for the gems Jekyll now depends on, so
# this reaches for the Homebrew Ruby instead. Homebrew keeps it out of the way of
# the system one, which is why it needs naming explicitly rather than just
# working. Gems live in ./vendor/bundle, already ignored by git.
#
# Starting from scratch on a new machine:
#   brew install ruby
#   ./serve.sh              (installs the gems on first run)

set -euo pipefail
cd "$(dirname "$0")"

BREW_RUBY="/opt/homebrew/opt/ruby/bin"
if [ -d "$BREW_RUBY" ]; then
  export PATH="$BREW_RUBY:$PATH"
fi

if ! ruby -e 'exit(RUBY_VERSION.split(".")[0].to_i >= 3)' 2>/dev/null; then
  echo "Ruby 3 or newer is needed. Install it with:  brew install ruby" >&2
  ruby -v >&2 || true
  exit 1
fi

if [ ! -d vendor/bundle ]; then
  echo "First run, installing gems into vendor/bundle..."
  gem list -i bundler >/dev/null 2>&1 || gem install bundler --no-document
  bundle config set --local path vendor/bundle
  bundle install
fi

# --livereload refreshes the browser when a file changes, which matters when the
# thing being tested is a quiz you have to click through.
exec bundle exec jekyll serve --livereload --host 127.0.0.1 "$@"
