# Dependencies

Everything vim-related is handled by vim-plug (see [README](README.md)) — the
plugins themselves install with `:PlugInstall` and need nothing extra. What's
listed here are the **external command-line tools** a few plugins shell out to.
They're all optional: Vim loads fine without them, you just lose that plugin's
feature until the tool is on your `$PATH`.

## Core

| Tool | Why | Install |
|------|-----|---------|
| `vim` 8.0+ | `plug#end()`, `t_Co=256`, `colorcolumn`, and the `version >= 703` block all assume a modern Vim. | your package manager |
| `git` | vim-plug clones/updates every plugin over git. | your package manager |
| `curl` | fallback vim-plug uses if a git clone is unavailable. | your package manager |

## Per-plugin external tools

### syntastic (linting)

syntastic only runs the checkers it can find. The ones this `.vimrc` configures:

| Filetype | Checker | Notes |
|----------|---------|-------|
| Python | `flake8` | `pip install flake8`. Args pinned in `.vimrc`: `--ignore=E501,E402,E722,W503`. |
| JavaScript | `jsl` (JavaScript Lint) | `--browser --nomen --indent=2`. Optional; drop the `Plug`/checker line if unused. |
| Puppet | `puppet-lint` | `gem install puppet-lint`. Checker line is present but commented — uncomment to enable. |

### black (Python formatting)

- The [`psf/black`](https://github.com/psf/black) plugin manages its own Python
  virtualenv on first `:Black`, so **no system `black` needed** — it just needs
  a working `python3`.
- `g:black_linelength = 79`. Mapped to `<F9>`.

### vim-puppet / Jenkinsfile / others

Pure Vimscript (syntax + indent only) — no external binaries required.

## Quick check

```sh
for t in vim git curl flake8 black puppet-lint jsl; do
  printf '%-12s ' "$t"; command -v "$t" || echo "(missing — optional)"
done
```

Anything reported missing just disables the matching feature; the rest of the
config works unchanged.
