---
layout: default
---

# `NO_COLOR`
### Last updated: {{ 'now' | date: "%Y-%m-%d" }}

An increasing number of command-line software programs output text with
[ANSI color](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors)
escape codes by default.
While some developers and users obviously prefer seeing these colors,
many users don't.
Unfortunately, every new piece of software seems to have a different way
of disabling colored text output and some software has no way at all.

Accepting the futility of trying to reverse this trend, an informal standard
is hereby proposed:

> **All command-line software which outputs text with ANSI color added should
check for the presence of a `NO_COLOR` environment variable that, when present
(regardless of  its value), prevents the addition of ANSI color.**

By adopting this standard, users that prefer to have plain, non-colored text
output can just set one environment variable in their shell to have it affect
all supported software.

This website will attempt to document which software has adopted this standard
and when.
For software that has not or will not adopt this standard, an attempt will be
made to document how to otherwise disable color.

To add software to this site,
[clone this site's Git repository](https://github.com/jcs/no_color)
and submit a pull request.

## Software supporting `NO_COLOR`

| Software | Version/Date Supported |
|:-|:-|
| [lr](https://github.com/chneukirchen/lr) | Supported from 2018-01-29 |
| [mblaze](https://github.com/chneukirchen/mblaze) | Supported from 2018-01-29 |
| [Snow](https://github.com/mortie/snow) | Supported from 2018-01-24 |
| [crayon](https://github.com/r-lang/crayon) | Supported from 2018-02-08 |
{: rules="groups"}

## Disabling color in software not supporting `NO_COLOR`

| Software | Method |
|:-|:-|
| [Bundler](https://bundler.io/) | `bundle COMMAND --no-color` ([Docs](https://bundler.io/v1.15/man/bundle.1.html)) |
| [Clang](https://clang.llvm.org/) | `-fno-color-diagnostics` ([Docs](https://clang.llvm.org/docs/UsersManual.html#formatting-of-diagnostics)) |
| [Cocoapods](https://cocoapods.org/) | `pod COMMAND --no-ansi` ([Docs](https://guides.cocoapods.org/terminal/commands.html#pod_install)) |
| [fzf](https://github.com/junegunn/fzf) | `fzf --color=bw` or `export FZF_DEFAULT_OPTS=--color=bw` ([Docs](https://github.com/junegunn/fzf/wiki/Color-schemes)) |
| [gcc](https://gcc.gnu.org/) | `GCC_COLORS=` or `-fno-color-diagnostics` ([Docs](https://gcc.gnu.org/onlinedocs/gcc-7.3.0/gcc/Diagnostic-Message-Formatting-Options.html)) |
| [Git](https://git-scm.com/) | `git config --global color.ui false` ([Docs](https://git-scm.com/docs/git-config#git-config-colorui))|
| [lynx](http://lynx.browser.org/) | `lynx -nocolor` (or `show_color=never` in `.lynxrc`) |
| [Mercurial](https://www.mercurial-scm.org/) | `hg --color=never` (or [Docs for .hgrc](https://www.mercurial-scm.org/wiki/ColorExtension)) |
| [Midnight Commander](https://midnight-commander.org/) | `mc --nocolor` |
| [Ripgrep](https://github.com/BurntSushi/ripgrep) | `rg --color=never` |
| [RSpec](http://rspec.info/) | `export SPEC_OPTS=--no-color` |
| [Ruby](https://www.ruby-lang.org/) | `export TEST_COLORS=pass=0:fail=0` |
| [The Silver Searcher](https://geoff.greer.fm/ag/) | `ag --nocolor` |
| [Thor](http://whatisthor.com/) | `export THOR_SHELL=Basic` ([Docs](http://www.rubydoc.info/github/wycats/thor/Thor%2FBase.shell)) |
| [util-linux](https://github.com/karelzak/util-linux) | `touch /etc/terminal-colors.d/disable` ([Docs](http://man7.org/linux/man-pages/man5/terminal-colors.d.5.html)) |
| [vim](http://www.vim.org/) | `vim '+set t_Co=0'` |
{: rules="groups"}

## Software with no mechanism to disable color

| Software | Notes |
|:-|:-|
| [Homebrew](https://brew.sh/) | [Rejected `NO_COLOR` patch](https://github.com/Homebrew/brew/pull/3090) |
{: rules="groups"}
