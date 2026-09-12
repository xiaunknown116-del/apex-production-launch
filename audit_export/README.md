# Audit Export Package (2026-09-11)

## Files
- `audit_export_20260911.json` – Primary audit export
- `audit_export_20260911.json.sha256` – SHA-256 checksum
- `audit_export_20260911.json.asc` – GPG detached signature (created by sign_audit.sh)
- `sign_audit.sh` – GPG signing script
- `upload_to_s3.sh` – S3 upload script (SSE-AES256)
- `package_manifest.txt` – File list

## Quick steps

1. Verify checksum:
   ```bash
   sha256sum -c audit_export_20260911.json.sha256
   ```

2. Sign (requires GPG key):
   ```bash
   export GPG_KEY_ID="your-key-id"
   ./sign_audit.sh
   ```

3. Upload to S3:
   ```bash
   export S3_BUCKET="s3://your-audit-bucket/apex-exports"
   export AWS_PROFILE="your-aws-profile"   # optional
   ./upload_to_s3.sh
   ```

## Security notes
- Keep the private GPG key offline where possible.
- Limit S3 bucket access to the audit team.
- This sample uses redacted placeholders. Production exports contain full records.
