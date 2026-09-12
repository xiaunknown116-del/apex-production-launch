#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "=== Apex Capital Production Launch (staging → dual-control gate) ==="
echo "This script prepares infrastructure and staging artifacts."
echo "Final production promotion requires dual-control (operator + approver WebAuthn)."
echo ""

TF_WORKSPACE="${TF_WORKSPACE:-staging}"
AWS_REGION="${AWS_REGION:-us-east-1}"
echo "Workspace: $TF_WORKSPACE | Region: $AWS_REGION"

echo ""
echo "1. Ensure audit export package is present..."
ls -la audit_export/ || { echo "Missing audit_export/"; exit 1; }

echo ""
echo "2. Verify audit checksum..."
(cd audit_export && sha256sum -c audit_export_20260911.json.sha256)

echo ""
echo "3. Next steps (manual / dual-control):"
echo "   - Apply Cloudflare Access policy (see docs/cloudflare-access-checklist.md)"
echo "   - Insert live Turnstile site key into contact form"
echo "   - Deploy public site from repo: https://github.com/xiaunknown116-del/apex-public-site"
echo "   - Create promotion proposal via admin control plane"
echo "   - Approver completes WebAuthn challenge"
echo ""
echo "Deployment preparation complete. Awaiting dual-control sign-off."
