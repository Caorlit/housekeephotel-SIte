#!/usr/bin/env bash
# Pubblica il sito housekeephotel.com sul server Hostinger.
# Questo repository va clonato in ~/websites/<ID-SITO>/.h5g/sito
# Uso (sul server):  cd ~/websites/<ID-SITO>/.h5g/sito && bash pubblica.sh
set -euo pipefail

cd "$(dirname "$0")"
REPO="$(pwd)"
WEB="${WEB_DIR:-$REPO/../../public_html}"
WEB="$(cd "$WEB" && pwd)"

case "$WEB" in
    */public_html) ;;
    *) echo "✗ La cartella web non sembra public_html: $WEB" >&2; exit 1 ;;
esac

echo "→ Aggiorno"
git pull --ff-only
[ -f public/index.html ] || { echo "✗ Manca public/index.html" >&2; exit 1; }

echo "→ Copio il sito in $WEB"
find "$WEB" -mindepth 1 -maxdepth 1 -exec rm -rf {} +
cp -R public/. "$WEB/"

echo "✓ Sito pubblicato. Svuota la cache della CDN in hPanel."
for p in / /en/ /es/ /privacy/ /grazie/; do
    echo "  $p → $(curl -s -o /dev/null -w '%{http_code}' "https://housekeephotel.com$p" || echo '?')"
done
