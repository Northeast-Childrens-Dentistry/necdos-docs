# Prose renames only. Lowercase "aurora" is almost always an identifier: leave it and allow-list it in allow.txt.
s/Aurora-DX/NECD OS/g
s/\bAurora\b([^-/a-z.]|\.( |$)|$)/NECD OS\1/g
# Docusaurus adds baseUrl to Markdown images but not to raw <img src="/img/...">
s#src="/img/#src="/necdos-docs/img/#g
