#!/usr/bin/env bash
set -euo pipefail

PUBLIC_URL="${PUBLIC_URL:-http://localhost:8080}"
echo "Smoke test against $PUBLIC_URL"

curl -fsS -o /dev/null -w "index.html → %{http_code}\n" "$PUBLIC_URL/" || echo "index failed"
curl -fsS -o /dev/null -w "governance.html → %{http_code}\n" "$PUBLIC_URL/governance.html" || echo "governance failed"
curl -fsS -o /dev/null -w "contact.html → %{http_code}\n" "$PUBLIC_URL/contact.html" || echo "contact failed"
curl -fsS -o /dev/null -w "admin-login.html → %{http_code}\n" "$PUBLIC_URL/admin-login.html" || echo "admin-login failed"

echo "Local smoke checks finished."
