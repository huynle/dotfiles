#!/usr/bin/zsh

if [[ -z "$BLOG_DIR" ]]; then
  echo "-- Set environment variable JOURNAL_DIR to where your journal entries are stored."
  exit 0;
fi

if [[ -z "$1" ]]; then
  DATE=$(date +"%Y-%m-%d")
else
  DATE=$1
fi

JOURNAL_PATH="$BLOG_DIR/content/private/journal/$DATE.md"

if [[ ! -f $JOURNAL_PATH ]]; then
  hugo new -s $BLOG_DIR private/journal/$DATE.md
fi

$EDITOR $JOURNAL_PATH

# $EDITOR "$JOURNAL_DIR/$DATE.md"
