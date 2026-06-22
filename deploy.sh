#!/bin/bash
# Lumen Solutions LLC — site deploy
# Usage: from anywhere: ~/lumen-core/website/deploy.sh
# Or with message: ~/lumen-core/website/deploy.sh "your message here"

set -e

cd "$(dirname "$0")"

MSG="${1:-deploy: $(date '+%Y-%m-%d %H:%M')}"

git add -A

if git diff --cached --quiet; then
  echo "Nothing to commit — already up to date."
else
  git commit -m "$MSG"
fi

git push origin main
echo "✓ Pushed. Netlify will deploy in ~10 seconds."
echo "  https://lumensolutions.co"
