# Apex Capital — Production Launch Artifacts

**Date:** 2026-09-12  
**Posture:** Institutional, read-only public site, dual-control control plane, no client money.

## Contents
- `production-launch-package.zip` — Full launch package (deploy scripts, smoke tests, CI workflow, audit export)
- `audit_export_package.zip` — Standalone audit export (JSON + real SHA-256 + sign/upload scripts)
- `checksums.sha256` — SHA-256 of the ZIP files

## Verification
```bash
sha256sum -c checksums.sha256
unzip -l production-launch-package.zip
```

## Related repositories
- https://github.com/xiaunknown116-del/apex-public-site
- https://github.com/xiaunknown116-del/apex-sandbox-api
- https://github.com/xiaunknown116-del/admin-control-plane

## Governance
- Release remains draft until dual-control approval.
- Public site is read-only / illustrative only.
