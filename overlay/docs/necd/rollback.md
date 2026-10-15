---
title: Rollback (Administrator)
---

If an update causes a problem, an administrator can go back to the previous version.

## Previous version

```bash
sudo bootc rollback && sudo reboot
```

## A specific older version

Every released version is kept as a dated tag:

```bash
sudo bootc switch --enforce-container-sigpolicy ghcr.io/northeast-childrens-dentistry/necdos:stable-<YYYYMMDD> && sudo reboot
```

Return to the latest version with the same command and `:stable`. The `--enforce-container-sigpolicy` flag makes the computer check the NECD signature; do not leave it out.
