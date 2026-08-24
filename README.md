# ngara's vim configuration

My Vim setup, managed with [vim-plug](https://github.com/junegunn/vim-plug).
The repo *is* `~/.vim`, and `~/.vimrc` is a symlink to the `.vimrc` in here.

## Layout

- `.vimrc` — all settings **and** the plugin list (between `plug#begin()` /
  `plug#end()`). This is the single source of truth.
- `autoload/plug.vim` — vim-plug itself, vendored so a fresh clone works
  offline / behind a proxy without an extra download step.
- `plugged/` — where vim-plug installs plugins. Git-ignored; never committed.

## Fresh machine setup

```sh
git clone https://github.com/ngara/vim.git ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
vim +PlugInstall +qall      # installs every plugin listed in .vimrc
```

`.vimrc` also self-bootstraps: if `autoload/plug.vim` is ever missing it
clones vim-plug and runs `:PlugInstall` on first launch.

## Managing plugins

Everything is driven from the `Plug '...'` lines in `.vimrc`:

- Add a plugin: add a `Plug 'owner/repo'` line, save, then `:PlugInstall`
- Update all plugins: `:PlugUpdate`
- Remove a plugin: delete its `Plug` line, then `:PlugClean`
- Update vim-plug itself: `:PlugUpgrade`
- Check status: `:PlugStatus`

No git submodules, no shell scripts to run — that's the whole point of the
move off pathogen.

A few plugins shell out to external command-line tools (linters, formatters).
Those are all optional and documented in [DEPENDENCIES.md](DEPENDENCIES.md).

## Currently installed

| Plugin | Purpose |
|--------|---------|
| [syntastic](https://github.com/vim-syntastic/syntastic) | syntax checking / linting |
| [oceanic-next](https://github.com/mhartington/oceanic-next) | color scheme (`colorscheme OceanicNext`) |
| [black](https://github.com/psf/black) (`stable` branch) | Python formatter (`:Black`, mapped to `<F9>`) |
| [vim-puppet](https://github.com/rodjek/vim-puppet) | Puppet syntax / indent |
| [Jenkinsfile-vim-syntax](https://github.com/martinda/Jenkinsfile-vim-syntax) | Jenkinsfile syntax |
| [tabular](https://github.com/godlygeek/tabular) | align text into columns |
| [vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace) | highlight / strip trailing whitespace |

## History

This config used to use [pathogen](https://github.com/tpope/vim-pathogen)
with each plugin pinned as a git submodule under `bundle/`, updated via a
`git submodule foreach git pull` script. It was migrated to vim-plug so the
plugin list lives in `.vimrc` and updates are a single `:PlugUpdate`.
