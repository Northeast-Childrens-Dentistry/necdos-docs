# NECD OS docs

Documentation for [NECD OS](https://github.com/Northeast-Childrens-Dentistry/necdos), published at https://northeast-childrens-dentistry.github.io/necdos-docs/.

Most pages come from the [Aurora documentation](https://github.com/ublue-os/aurora-docs) (Apache-2.0). Aurora's pages are **not stored here**: every day CI clones them, removes pages that don't apply, renames Aurora to NECD OS, adds our pages and publishes. See [build.sh](build.sh).

| File | Purpose |
| --- | --- |
| `overlay/` | Our own pages, config and logo. A file here replaces an upstream file of the same path. |
| `exclude.txt` | Upstream pages to drop. |
| `rebrand.sed` | Text renames. |
| `allow.txt` | "aurora" mentions that may stay (image names, URLs). |
| `forbid.txt` | Text that must never appear (disabled commands, personal setup). Fails the build. |

If a build fails, the live site stays as it was and a `docs-build-failure` issue is opened listing the page and line. Fix it by adding a line to `exclude.txt`, `rebrand.sed` or `allow.txt`. Test locally with `./build.sh` (needs git and bun).

Licensed Apache-2.0, like the upstream docs.
