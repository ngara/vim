#!/usr/bin/env bash
set -euo pipefail

vim_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

ln -sf "$vim_dir/.vimrc" ~/.vimrc

# -es implies -u NONE unless -u is given, so force our vimrc explicitly.
# PlugInstall's cleanup unmaps keys that batch mode never mapped, which makes
# vim exit non-zero (E31) even on a successful install, so don't let that
# trip set -e here.
vim -u ~/.vimrc -es -c 'PlugInstall --sync' -c 'qa!' || true
