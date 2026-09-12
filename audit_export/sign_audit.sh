#!/usr/bin/env bash
set -euo pipefail

EXPORT_DIR="$(cd "$(dirname "$0")" && pwd)"
FILE="$EXPORT_DIR/audit_export_20260911.json"
KEY_ID="${GPG_KEY_ID:-}"

if [ -z "$KEY_ID" ]; then
  echo "ERROR: Set GPG_KEY_ID environment variable to your signing key id."
  exit 2
fi

if [ ! -f "$FILE" ]; then
  echo "ERROR: Export file not found: $FILE"
  exit 3
fi

echo "Signing $FILE with GPG key $KEY_ID..."
gpg --batch --yes --local-user "$KEY_ID" --armor --detach-sign --output "${FILE}.asc" "$FILE"
echo "Signature created: ${FILE}.asc"

echo "Verifying signature..."
gpg --verify "${FILE}.asc" "$FILE"
echo "GPG verification complete."
