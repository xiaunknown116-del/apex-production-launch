# Package Notes

## production-launch-package.zip
Contains:
- audit_export/ (JSON + real SHA-256 + sign_audit.sh + upload_to_s3.sh)
- scripts/deploy_production.sh (staging + dual-control gate)
- scripts/smoke_tests.sh
- .github/workflows/sign-and-publish-audit.yml

## audit_export_package.zip
Standalone audit export package only.

## Integrity
Both ZIPs have SHA-256 recorded in checksums.sha256.
The audit JSON inside has been verified: `audit_export_20260911.json: OK`

## Local path (sandbox)
`/home/workdir/artifacts/apex-capital-complete/dist/production-launch-package.zip`
