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
output can set one environment variable in their shell to have it automatically
affect all supported software.

This website will document which software has adopted this standard and when
support was added.
For software that has not or will not adopt this standard, an attempt will be
made to document how to otherwise disable color.

To add software to this site,
[clone this site's Git repository](https://github.com/jcs/no_color)
and submit a pull request.

## Color libraries supporting `NO_COLOR` to disable default color output

Software using these libraries to output color inherently support disabling
color via `NO_COLOR`.

| Software | Description | Version/Date Supported |
|:-|:-|:-|
| [cli-color](https://github.com/medikoo/cli-color) | NPM package for colors and formatting | [2.0.0](https://github.com/medikoo/cli-color/releases/tag/v2.0.0) |
| [ColorDebug](https://github.com/roboticslab-uc3m/color-debug) | Colorful command line output C/C++ macros | [2019-02-09](https://github.com/roboticslab-uc3m/color-debug/commit/2e2a5bf5a202228985612008967fb63ba8be53d8) |
| [colored](https://github.com/mackwic/colored) | Rust crate for coloring terminal output | [1.7.0](https://github.com/mackwic/colored/blob/master/CHANGELOG.md#170-january-2019) |
| [crayon](https://github.com/r-lib/crayon) | R package for colored terminal output | [2018-02-08](https://github.com/r-lib/crayon/commit/700800135d04408bf1c99426b3fec9a4073b8a97) |
| [LogColor](https://github.com/induane/logcolor) | Python library for coloring output in log messages | [2018-01-24](https://github.com/induane/logcolor/commit/0092b0af2a1506eee2b0ca028b1cf51f78fc91fa) |
| [Pastel](https://github.com/silkfire/Pastel) | Tiny .NET Core library for coloring console output | [1.2.0](https://github.com/silkfire/Pastel/commit/8a89c2930a2b7ff2c6beae67e6c00fe1d74189d5) |
| [TextOutput](https://github.com/xyproto/textoutput) | Go package for controlling text output, using VT100 terminal codes | [1.9.1](https://github.com/xyproto/textoutput/tree/v1.9.1) |
{: rules="groups"}

## Software directly supporting `NO_COLOR` to disable default color output

| Software | Description | Version/Date Supported |
|:-|:-|:-|
| [alogview](https://github.com/flimberger/alogview) | Android logcat Filter | [2018-10-31](https://github.com/flimberger/alogview/commit/785e5608711d92a1c41733f9ecfa3ed2d335a940) |
| [Ammonite](https://github.com/lihaoyi/Ammonite) | Scala Scripting | [1.0.0](https://github.com/lihaoyi/Ammonite/releases/tag/1.0.0) |
| [beets](https://github.com/beetbox/beets) | Music library manager and MusicBrainz tagger | [1.4.9](https://github.com/beetbox/beets/releases/tag/v1.4.9) |
| [bfs](https://github.com/tavianator/bfs) | Breadth-first version of the UNIX find command | [1.4.1](https://github.com/tavianator/bfs/releases/tag/1.4.1) |
| [Bikeshed](https://github.com/tabatkins/bikeshed) | Spec/Document Processor | [2018-07-27](https://github.com/tabatkins/bikeshed/commit/04ea123d607a8d4bed692ad73dda1cb343bb5bbe) |
| [Bloop](https://github.com/scalacenter/bloop) | Compilation/test server for Scala and Java | [2018-07-02](https://github.com/scalacenter/bloop/pull/555/commits/ff6f17a0155633f86440e10d7889f077e7fbc91c) |
| [CakePHP](https://github.com/cakephp/cakephp) | Full stack framework for PHP | [4.1.0](https://github.com/cakephp/cakephp/pull/14158) |
| [csv2db](https://csv2db.github.io/) | CSV database loading tool | [1.4.0](https://github.com/csv2db/csv2db/releases/tag/v1.4.0) |
| [DataLad](https://www.datalad.org/) | Data management and publication multitool | [0.11.5](https://github.com/datalad/datalad/releases/tag/0.11.5) |
| [deno](https://github.com/denoland/deno) | Secure TypeScript runtime | [0.2.11](https://github.com/denoland/deno/releases/tag/v0.2.11) |
| [elfinfo](https://github.com/xyproto/elfinfo) | Utility for displaying which compiler was used for creating an ELF | [1.0.1](https://github.com/xyproto/elfinfo/tree/1.0.1) |
| [ffind](https://github.com/josephscade/ffind) | Rust utility to find files and folders | [2018-03-24](https://github.com/josephscade/ffind/commit/fec4aa6101f2b3d6d5b06df640e299d0b1fbb190) |
| [forest-arborist](https://github.com/JohnRGee/forest-arborist) | Manage a loosely coupled forest of git or hg repositories | [1.2.0](https://github.com/JohnRGee/forest-arborist/releases/tag/v1.2.0) |
| [fselect](https://github.com/jhspetersson/fselect) | Command-line utility for finding files with SQL-like expressions | [0.6.1](https://github.com/jhspetersson/fselect/releases/tag/0.6.1) |
| [gatsby-cli](https://github.com/gatsbyjs/gatsby/blob/master/packages/gatsby-cli) | The GatsbyJS command line interface (CLI) | [2019-08-05](https://github.com/gatsbyjs/gatsby/commit/ccebe174078529329a26350224a1a5730567c695) |
| [git-subline-merge](https://github.com/paulaltin/git-subline-merge) | Git merge driver for resolving conflicts on individual or adjacent lines | [2019-07-27](https://github.com/paulaltin/git-subline-merge/commit/d8f738a62f96dfdf315511cece7c93526e48baef) |
| [gopass](https://github.com/gopasspw/gopass) | Password store for teams | [1.8.0](https://github.com/gopasspw/gopass/releases/tag/v1.8.0) |
| [Homebrew](https://brew.sh/) | Package manager for macOS | [1.5.5](https://github.com/Homebrew/brew/releases/tag/1.5.5) |
| [KBSecret](https://kbsecret.github.io/) | Secret manager backed by Keybase and KBFS | [1.4.0](https://github.com/kbsecret/kbsecret/commit/d5296054d979a1b1ce07c1be78d56d3d29b62384) |
| [kitten](https://github.com/hoffa/kitten) | Tiny multi-server automation tool | [0.2.14](https://github.com/hoffa/kitten/commit/88cb015f4ae021a1c00bfc4dc9506a8e14e51bb4) |
| [konch](https://github.com/sloria/konch) | Python shell/REPL configuration tool | [4.0.0](https://github.com/sloria/konch/blob/master/CHANGELOG.rst#400-2019-01-19) |
| [lc](https://github.com/c-blake/lc) | multi-dimensional, abbreviating ls/file lister in Nim | [2019-11-18](https://github.com/c-blake/lc/commit/3f69e692db45c63320c3cbd2d3910208437687f9) |
| [lr](https://github.com/chneukirchen/lr) | File list generator | [2018-01-29](https://github.com/chneukirchen/lr/commit/8f0ac7c8abb4e0830d6cf72bbbd5f38c44b4266d) |
| [mblaze](https://github.com/chneukirchen/mblaze) | Unix utilities to deal with Maildir | [2018-01-29](https://github.com/chneukirchen/mblaze/commit/4014f03afe6d624ba1c6bdde6551b4996ba31fe5) |
| [Middleman](https://middlemanapp.com) | Ruby-based static site generator | [2019-02-18](https://github.com/middleman/middleman/commit/3040ffa1331aa48c76ae5ca7f4b2e0a0f1b7af15) |
| [mu](https://www.djcbsoftware.nl/code/mu/) | Maildir indexer/searcher | [2019-02-02](https://github.com/djcb/mu/commit/eb6efee81db22531ef05e140549bde7e87dd9725) |
| [NGLess](http://ngless.embl.de/) | Domain specific language for bioinformatics | [2018-10-29](https://github.com/ngless-toolkit/ngless/commit/15926150701100ff96b4a7cd1f3142f9a272b983) |
| [npm](https://www.npmjs.com/) | Package manager for JavaScript | [5.8.0](https://github.com/npm/npm/releases/tag/v5.8.0) |
| [nvh](https://github.com/JohnRGee/nvh) | Node Version Helper | [4.1.0](https://github.com/JohnRGee/nvh/releases/tag/v4.1.0) |
| [o](https://github.com/xyproto/o) | Small, fast and limit text editor | [2.13.2](https://github.com/xyproto/o/tree/2.13.2) |
| [picocli](https://github.com/remkop/picocli/) | A mighty tiny Java command line interface | [3.9.0](https://github.com/remkop/picocli/releases/tag/v3.9.0#3.9.0-ANSI-heuristics) |
| [Planck](https://planck-repl.org/) | Stand-alone ClojureScript REPL | [2.23.0](https://github.com/planck-repl/planck/releases/tag/2.23.0) |
| [procs](https://github.com/c-blake/procs) | Process&system query&formatting | [2019-11-18](https://github.com/c-blake/procs/commit/7d19fc184f8c29481dd5a4c4d5d26c671c2c0a4c) |
| [pulumi](https://pulumi.io/) | Programming-language-based IaC framework | [0.14.3](https://github.com/pulumi/pulumi/pull/1594) |
| [PyDERASN](http://pyderasn.cypherpunks.ru/) | Python ASN.1 DER library | [2018-02-14](https://git.cypherpunks.ru/cgit.cgi/pyderasn.git/commit/?id=54876436a23f14951f2e6353e9072c9a098b35b4) |
| [rsmodules](https://github.com/fretn/rsmodules) | Manage your environment by the use of modulefiles | [2018-10-09](https://github.com/fretn/rsmodules/commit/87a45f96a9bd45b86300a6027bb29855778d4f5e) |
| [smenu](https://github.com/p-gen/smenu) | Terminal selection filter | [2018-02-05](https://github.com/p-gen/smenu/commit/70d3ee5a328230dff3b744b2f0ca7ef20ecb530e) |
| [Snow](https://github.com/mortie/snow) | Testing library for C | [2018-01-24](https://github.com/mortie/snow/commit/aadbbd375e03ec6000e23d817d2bd722b417296f) |
| [Symfony](https://github.com/symfony/symfony) | PHP framework and reusable components | [4.4.0](https://symfony.com/releases/4.4) |
| [taoup](http://github.com/globalcitizen/taoup) | Fortune implementation | [2018-09-10](https://github.com/globalcitizen/taoup/commit/fb2dc7768a2dc9b74816ce5126e40b93338291f7) |
| [txtnish](https://github.com/mdom/txtnish) | Twtxt microblogging client | [2018-08-31](https://github.com/mdom/txtnish/commit/257d312ac282ab99e8357e31f6c282b881fbb171) |
| [twa](https://github.com/trailofbits/twa) | A tiny web auditor with strong opinions | [1.1.0](https://github.com/trailofbits/twa/releases/tag/1.1.0) |
| [undertime](https://gitlab.com/anarcat/undertime) | Timezone coordination tool | [2018-06-06](https://gitlab.com/anarcat/undertime/commit/0c4c2b38f32127a0dc59d2bd6e5f9db0b61ca847) |
{: rules="groups"}

## Disabling color in software not supporting `NO_COLOR`

| Software | Method |
|:-|:-|
| [Ammonite](https://github.com/lihaoyi/Ammonite) | `amm --color false` ([Docs](https://ammonite.io/#1.0.0)) |
| [Ansible](https://github.com/ansible/ansible) | `export ANSIBLE_NOCOLOR=true` ([Docs](http://docs.ansible.com/ansible/latest/intro_configuration.html#nocolor)) |
| [Arcanist](https://github.com/phacility/arcanist) | `arc --no-ansi COMMAND` ([Docs](http://manpages.ubuntu.com/manpages/xenial/man1/arc.1.html)) |
| [Bundler](https://bundler.io/) | `bundle COMMAND --no-color` ([Docs](https://bundler.io/v1.15/man/bundle.1.html)) |
| [Clang](https://clang.llvm.org/) | `-fno-color-diagnostics` ([Docs](https://clang.llvm.org/docs/UsersManual.html#formatting-of-diagnostics)) |
| [Cocoapods](https://cocoapods.org/) | `pod COMMAND --no-ansi` ([Docs](https://guides.cocoapods.org/terminal/commands.html#pod_install)) |
| [fzf](https://github.com/junegunn/fzf) | `fzf --color=bw` or `export FZF_DEFAULT_OPTS=--color=bw` ([Docs](https://github.com/junegunn/fzf/wiki/Color-schemes)) |
| [GCC](https://gcc.gnu.org/) | `export GCC_COLORS=` or `-fno-color-diagnostics` ([Docs](https://gcc.gnu.org/onlinedocs/gcc-7.3.0/gcc/Diagnostic-Message-Formatting-Options.html)) |
| [Git](https://git-scm.com/) | `git config --global color.ui false` ([Docs](https://git-scm.com/docs/git-config#git-config-colorui))|
| [Lynx](http://lynx.browser.org/) | `lynx -nocolor` (or `show_color=never` in `.lynxrc`) |
| [Mercurial](https://www.mercurial-scm.org/) | `hg --color=never` (or [Docs for .hgrc](https://www.mercurial-scm.org/wiki/ColorExtension)) |
| [Midnight Commander](https://midnight-commander.org/) | `mc --nocolor` |
| [Packer](https://www.packer.io/) | `export PACKER_NO_COLOR=true` |
| [Radare](https://www.radare.org/r/) | `radare2 -e scr.color=0` |
| [Ripgrep](https://github.com/BurntSushi/ripgrep) | `rg --color=never` |
| [RSpec](http://rspec.info/) | `export SPEC_OPTS=--no-color` |
| [Ruby](https://www.ruby-lang.org/) | `export RUBY_TESTOPTS=--color=never` |
| [The Silver Searcher](https://geoff.greer.fm/ag/) | `ag --nocolor` ([Rejected `NO_COLOR` Request](https://github.com/ggreer/the_silver_searcher/pull/1207)) |
| [Thor](http://whatisthor.com/) | `export THOR_SHELL=Basic` ([Docs](http://www.rubydoc.info/github/wycats/thor/Thor%2FBase.shell)) |
| [util-linux](https://github.com/karelzak/util-linux) | `touch /etc/terminal-colors.d/disable` ([Docs](http://man7.org/linux/man-pages/man5/terminal-colors.d.5.html)) |
| [Vim](http://www.vim.org/) | `vim '+set t_Co=0'` |
{: rules="groups"}

## Frequently Asked Questions

1. **Why not just set `$TERM` to `dumb` or `xterm` without color support?
Or change all color definitions in the terminal to print black?**

	The terminal is capable of color and should be able to print color when
	instructed.
	`NO_COLOR` is a hint to the software running in the terminal to suppress
	addition of color, not to the terminal to prevent any color from being
	shown.

	It is reasonable to configure certain software such as a text editor to use
	color or other ANSI attributes sparingly (such as the reverse attribute for
	a status bar) while still desiring that other software not add color unless
	configured to.
	It should be up to the user whether color is used, not the software author.

2. **How should configuration files and command-line arguments be processed
in the presence of `$NO_COLOR`?**

	User-level configuration files and per-instance command-line arguments
	should override `$NO_COLOR`.
	A user should be able to export `$NO_COLOR` in their shell configuration
	file as a default, but configure a specific program in its configuration
	file to specifically enable color.

	This also means that software that *can* add color but doesn't by default
	does not need to care about `$NO_COLOR`, because it will only ever be
	adding color when instructed to do so (as it should be).
