#!/usr/bin/env bash
# Builds the NECD OS docs site from the latest aurora-docs. Output: work/build/
# Run from the repo root. Needs git and bun.
set -euo pipefail
cd "$(dirname "$0")"

rm -rf work
git clone --quiet --depth 1 https://github.com/ublue-os/aurora-docs work
echo "Upstream: $(git -C work rev-parse --short HEAD)"

# 1. Drop pages that don't apply to NECD OS
grep -vE '^\s*(#|$)' exclude.txt | while read -r p; do rm -rf "work/$p"; done

# 2. Excluded pages are what pagination points at; a missing target breaks the build
grep -rlE '^pagination_(next|prev):' work/docs | xargs -r sed -i -E '/^pagination_(next|prev):/d'

# 3. Rename prose
find work/docs -type f \( -name '*.md' -o -name '*.mdx' \) -exec sed -E -i -f rebrand.sed {} +

# 4. Checks on upstream text we keep (our own pages may name Aurora). Print file:line and fail.
(cd overlay && find docs -type f) | while read -r f; do rm -f "work/$f"; done
fail=0
grep -vE '^\s*(#|$)' allow.txt > work/.allow
grep -vE '^\s*(#|$)' forbid.txt > work/.forbid
left=$(grep -rniE 'aurora' work/docs | grep -vEf work/.allow || true)

# 5. NECD files win over upstream ones of the same name
cp -r overlay/. work/
bad=$(grep -rniE -f work/.forbid work/docs || true)
if [[ -n "$left" ]]; then echo "::error::Leftover Aurora mentions (rename in rebrand.sed or add to allow.txt):"; echo "$left"; fail=1; fi
if [[ -n "$bad" ]]; then echo "::error::Forbidden text (exclude the page in exclude.txt):"; echo "$bad"; fail=1; fi
[[ $fail == 0 ]] || exit 1

# 6. Build
cd work
bun install --frozen-lockfile
bun run build
