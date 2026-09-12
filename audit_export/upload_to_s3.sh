#!/usr/bin/env bash
set -euo pipefail

EXPORT_DIR="$(cd "$(dirname "$0")" && pwd)"
FILE="$EXPORT_DIR/audit_export_20260911.json"
SIG="${FILE}.asc"
S3_BUCKET="${S3_BUCKET:-s3://your-audit-bucket/apex-exports}"
AWS_PROFILE_OPT=""

if [ -n "${AWS_PROFILE:-}" ]; then
  AWS_PROFILE_OPT="--profile $AWS_PROFILE"
fi

if [ ! -f "$FILE" ]; then
  echo "ERROR: Export file not found: $FILE"
  exit 2
fi

if [ ! -f "$SIG" ]; then
  echo "ERROR: Signature file not found: $SIG"
  echo "Run ./sign_audit.sh first."
  exit 3
fi

echo "Uploading $FILE to $S3_BUCKET ..."
aws s3 cp "$FILE" "$S3_BUCKET/" $AWS_PROFILE_OPT \
  --acl bucket-owner-full-control \
  --sse AES256 \
  --metadata export-id="audit-export-20260911-0001" \
  --tagging "env=staging&export=20260911"

echo "Uploading signature $SIG to $S3_BUCKET ..."
aws s3 cp "$SIG" "$S3_BUCKET/" $AWS_PROFILE_OPT \
  --acl bucket-owner-full-control \
  --sse AES256 \
  --metadata export-id="audit-export-20260911-0001" \
  --tagging "env=staging&export=20260911"

echo "Upload complete."
