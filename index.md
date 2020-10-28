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
| [Dye](https://github.com/dduan/Dye) | Cross-platform terminal styling for Swift command-line interface | [0.0.1](https://github.com/dduan/Dye/releases/tag/0.0.1) |
| [kleur](https://github.com/lukeed/kleur) | A Node.js library for formatting terminal text with ANSI colors | [4.1.0](https://github.com/lukeed/kleur/releases/tag/v4.1.0) |
| [LogColor](https://github.com/induane/logcolor) | Python library for coloring output in log messages | [2018-01-24](https://github.com/induane/logcolor/commit/0092b0af2a1506eee2b0ca028b1cf51f78fc91fa) |
| [MatthiWare. CommandLineParser](https://github.com/MatthiWare/CommandLineParser.Core) | C# Command Line Parser Library | [0.3.1](https://github.com/MatthiWare/CommandLineParser.Core/commit/240154043afadee1a581866f537b22048d2f69bc) |
| [paint](https://github.com/janlelis/paint) | Ruby gem for terminal colors and effects | [2.2.0](https://github.com/janlelis/paint/tree/v2.2.0) |
| [Pastel](https://github.com/silkfire/Pastel) | Tiny .NET Core library for coloring console output | [1.2.0](https://github.com/silkfire/Pastel/commit/8a89c2930a2b7ff2c6beae67e6c00fe1d74189d5) |
| [Term::ANSIColor](https://metacpan.org/release/Term-ANSIColor) | Perl library for color output using ANSI escape sequences | [5.01](https://metacpan.org/changes/release/RRA/Term-ANSIColor-5.01) |
| [termcolor](https://github.com/BurntSushi/termcolor) | Rust crate for cross platform terminal colors | [1.1.0](https://github.com/BurntSushi/termcolor/commit/423e28eb69a77799179474575869c5b0433d6adb) |
| [TextOutput](https://github.com/xyproto/textoutput) | Go package for controlling text output, using VT100 terminal codes | [1.9.1](https://github.com/xyproto/textoutput/tree/v1.9.1) |
{: rules="groups"}

## Software directly supporting `NO_COLOR` to disable default color output

| Software | Description | Version/Date Supported |
|:-|:-|:-|
| [alogview](https://github.com/flimberger/alogview) | Android logcat Filter | [2018-10-31](https://github.com/flimberger/alogview/commit/785e5608711d92a1c41733f9ecfa3ed2d335a940) |
| [Ammonite](https://github.com/lihaoyi/Ammonite) | Scala Scripting | [1.0.0](https://github.com/lihaoyi/Ammonite/releases/tag/1.0.0) |
| [Archey 4](https://github.com/HorlogeSkynet/archey4) | Python system information tool | [4.8.0](https://github.com/HorlogeSkynet/archey4/releases/tag/v4.8.0) |
| [bat](https://github.com/sharkdp/bat) | A cat(1) clone with syntax highlighting and Git integration | [0.16.0](https://github.com/sharkdp/bat/releases/tag/v0.16.0) |
| [beets](https://github.com/beetbox/beets) | Music library manager and MusicBrainz tagger | [1.4.9](https://github.com/beetbox/beets/releases/tag/v1.4.9) |
| [bfs](https://github.com/tavianator/bfs) | Breadth-first version of the UNIX find command | [1.4.1](https://github.com/tavianator/bfs/releases/tag/1.4.1) |
| [Bikeshed](https://github.com/tabatkins/bikeshed) | Spec/Document Processor | [2018-07-27](https://github.com/tabatkins/bikeshed/commit/04ea123d607a8d4bed692ad73dda1cb343bb5bbe) |
| [Bloop](https://github.com/scalacenter/bloop) | Compilation/test server for Scala and Java | [2018-07-02](https://github.com/scalacenter/bloop/pull/555/commits/ff6f17a0155633f86440e10d7889f077e7fbc91c) |
| [CakePHP](https://github.com/cakephp/cakephp) | Full stack framework for PHP | [4.1.0](https://github.com/cakephp/cakephp/pull/14158) |
| [cdist](https://www.cdi.st/) | Usable configuration management | [6.6.0](https://code.ungleich.ch/ungleich-public/cdist/-/releases/6.6.0) |
| [chezmoi](https://chezmoi.io/) | Manage dotfiles across multiple machines, securely | [1.8.1](https://github.com/twpayne/chezmoi/releases/tag/v1.8.1) |
| [Cras](https://sr.ht/~emvigo/cras) | Cras: The Anti-Procrastination Tool | [0.1.0](https://git.sr.ht/~emvigo/cras/tree/0.1.0) |
| [csv2db](https://csv2db.github.io/) | CSV database loading tool | [1.4.0](https://github.com/csv2db/csv2db/releases/tag/v1.4.0) |
| [DataLad](https://www.datalad.org/) | Data management and publication multitool | [0.11.5](https://github.com/datalad/datalad/releases/tag/0.11.5) |
| [deno](https://github.com/denoland/deno) | Secure TypeScript runtime | [0.2.11](https://github.com/denoland/deno/releases/tag/v0.2.11) |
| [elfinfo](https://github.com/xyproto/elfinfo) | Utility for displaying ELF information | [1.0.1](https://github.com/xyproto/elfinfo/tree/1.0.1) |
| [enum4linux-ng](https://github.com/cddmp/enum4linux-ng) | Next generation enum4linux (Windows/Samba enumeration tool) | [2020-10-24](https://github.com/cddmp/enum4linux-ng/commit/fa8f371de9975d4613c6ed9582b26db2584d10d8) |
| [Elixir](https://elixir-lang.org) | Dynamic, functional language | [1.10.0](https://github.com/elixir-lang/elixir/releases/tag/v1.10.0) |
| [fd](https://github.com/sharkdp/fd) | Simple, fast, and user-friendly alternative to `find` | [7.5.0](https://github.com/sharkdp/fd/releases/tag/v7.5.0) |
| [ffind](https://github.com/josephscade/ffind) | Rust utility to find files and folders | [2018-03-24](https://github.com/josephscade/ffind/commit/fec4aa6101f2b3d6d5b06df640e299d0b1fbb190) |
| [forest-arborist](https://github.com/JohnRGee/forest-arborist) | Manage a loosely coupled forest of git or hg repositories | [1.2.0](https://github.com/JohnRGee/forest-arborist/releases/tag/v1.2.0) |
| [fselect](https://github.com/jhspetersson/fselect) | Utility for finding files with SQL-like expressions | [0.6.1](https://github.com/jhspetersson/fselect/releases/tag/0.6.1) |
| [gatsby-cli](https://github.com/gatsbyjs/gatsby/blob/master/packages/gatsby-cli) | GatsbyJS command line interface | [2019-08-05](https://github.com/gatsbyjs/gatsby/commit/ccebe174078529329a26350224a1a5730567c695) |
 | [GitHub CLI](https://github.com/cli/cli) | CLI for GitHub to manage pull requests, issues, and others | [2020-09-16](https://github.com/cli/cli/pull/1631) |
| [git-subline-merge](https://github.com/paulaltin/git-subline-merge) | Git merge driver for resolving conflicts | [2019-07-27](https://github.com/paulaltin/git-subline-merge/commit/d8f738a62f96dfdf315511cece7c93526e48baef) |
| [gopass](https://github.com/gopasspw/gopass) | Password store for teams | [1.8.0](https://github.com/gopasspw/gopass/releases/tag/v1.8.0) |
| [Homebrew](https://brew.sh/) | Package manager for macOS | [1.5.5](https://github.com/Homebrew/brew/releases/tag/1.5.5) |
| [KBSecret](https://kbsecret.github.io/) | Secret manager backed by Keybase and KBFS | [1.4.0](https://github.com/kbsecret/kbsecret/commit/d5296054d979a1b1ce07c1be78d56d3d29b62384) |
| [kitten](https://github.com/hoffa/kitten) | Tiny multi-server automation tool | [0.2.14](https://github.com/hoffa/kitten/commit/88cb015f4ae021a1c00bfc4dc9506a8e14e51bb4) |
| [konch](https://github.com/sloria/konch) | Python shell/REPL configuration tool | [4.0.0](https://github.com/sloria/konch/blob/master/CHANGELOG.rst#400-2019-01-19) |
| [lc](https://github.com/c-blake/lc) | Multi-dimensional, abbreviating ls/file lister in Nim | [2019-11-18](https://github.com/c-blake/lc/commit/3f69e692db45c63320c3cbd2d3910208437687f9) |
| [lr](https://github.com/chneukirchen/lr) | File list generator | [2018-01-29](https://github.com/chneukirchen/lr/commit/8f0ac7c8abb4e0830d6cf72bbbd5f38c44b4266d) |
| [mblaze](https://github.com/chneukirchen/mblaze) | Unix utilities to deal with Maildir | [2018-01-29](https://github.com/chneukirchen/mblaze/commit/4014f03afe6d624ba1c6bdde6551b4996ba31fe5) |
| [meli](https://meli.delivery) | Terminal mail client in Rust | [2019-01-27](https://github.com/meli/meli/commit/6a7cae09882d43c0de8a84df3d66174949ede0e0) |
| [Middleman](https://middlemanapp.com) | Ruby-based static site generator | [2019-02-18](https://github.com/middleman/middleman/commit/3040ffa1331aa48c76ae5ca7f4b2e0a0f1b7af15) |
| [Modules](http://modules.sourceforge.net/) | Dynamic modification of one's environment | [4.5.0](https://github.com/cea-hpc/modules/releases/tag/v4.5.0) |
| [mu](https://www.djcbsoftware.nl/code/mu/) | Maildir indexer/searcher | [2019-02-02](https://github.com/djcb/mu/commit/eb6efee81db22531ef05e140549bde7e87dd9725) |
| [Nette Tester](https://tester.nette.org/) | Testing library for PHP | [2.3.3](https://github.com/nette/tester/releases/tag/v2.3.3) |
| [NGLess](http://ngless.embl.de/) | Domain specific language for bioinformatics | [2018-10-29](https://github.com/ngless-toolkit/ngless/commit/15926150701100ff96b4a7cd1f3142f9a272b983) |
| [nnn](https://github.com/jarun/nnn) | File manager | [2020-04-05](https://github.com/jarun/nnn/commit/f14fb9c0f92c25ab79dd0c47d16f075199aeb999) |
| [npm](https://www.npmjs.com/) | Package manager for JavaScript | [5.8.0](https://github.com/npm/npm/releases/tag/v5.8.0) |
| [nvh](https://github.com/JohnRGee/nvh) | Node Version Helper | [4.1.0](https://github.com/JohnRGee/nvh/releases/tag/v4.1.0) |
| [o](https://github.com/xyproto/o) | Small, fast, and limited text editor | [2.13.2](https://github.com/xyproto/o/tree/2.13.2) |
| [picocli](https://github.com/remkop/picocli/) | Tiny Java command line interface | [3.9.0](https://github.com/remkop/picocli/releases/tag/v3.9.0#3.9.0-ANSI-heuristics) |
| [Planck](https://planck-repl.org/) | Stand-alone ClojureScript REPL | [2.23.0](https://github.com/planck-repl/planck/releases/tag/2.23.0) |
| [procs](https://github.com/c-blake/procs) | Process and system query and formatting | [2019-11-18](https://github.com/c-blake/procs/commit/7d19fc184f8c29481dd5a4c4d5d26c671c2c0a4c) |
| [pulumi](https://pulumi.io/) | Programming-language-based IaC framework | [0.14.3](https://github.com/pulumi/pulumi/pull/1594) |
| [PyDERASN](http://pyderasn.cypherpunks.ru/) | Python ASN.1 DER library | [2018-02-14](https://git.cypherpunks.ru/cgit.cgi/pyderasn.git/commit/?id=54876436a23f14951f2e6353e9072c9a098b35b4) |
| [pytest](https://pytest.org) | Python testing framework | [6.0.0](https://docs.pytest.org/en/stable/changelog.html#pytest-6-0-0-2020-07-28) |
| [rsmodules](https://github.com/fretn/rsmodules) | Manage one's environment by the use of modulefiles | [2018-10-09](https://github.com/fretn/rsmodules/commit/87a45f96a9bd45b86300a6027bb29855778d4f5e) |
| [ShellSpec](https://shellspec.info/) | A full-featured BDD unit testing framework for shell scripts | [0.25.0](https://github.com/shellspec/shellspec/releases/tag/0.25.0) |
| [smenu](https://github.com/p-gen/smenu) | Terminal selection filter | [2018-02-05](https://github.com/p-gen/smenu/commit/70d3ee5a328230dff3b744b2f0ca7ef20ecb530e) |
| [Snow](https://github.com/mortie/snow) | Testing library for C | [2018-01-24](https://github.com/mortie/snow/commit/aadbbd375e03ec6000e23d817d2bd722b417296f) |
| [Symfony](https://github.com/symfony/symfony) | PHP framework and reusable components | [4.4.0](https://symfony.com/releases/4.4) |
| [taoup](http://github.com/globalcitizen/taoup) | Fortune implementation | [2018-09-10](https://github.com/globalcitizen/taoup/commit/fb2dc7768a2dc9b74816ce5126e40b93338291f7) |
| [tealdeer](http://github.com/dbrgn/tealdeer) | TLDR pages client | [1.4.0](https://github.com/dbrgn/tealdeer/releases/tag/v1.4.0) |
| [txtnish](https://github.com/mdom/txtnish) | Twtxt microblogging client | [2018-08-31](https://github.com/mdom/txtnish/commit/257d312ac282ab99e8357e31f6c282b881fbb171) |
| [twa](https://github.com/trailofbits/twa) | Tiny web auditor with strong opinions | [1.1.0](https://github.com/trailofbits/twa/releases/tag/1.1.0) |
| [undertime](https://gitlab.com/anarcat/undertime) | Timezone coordination tool | [2018-06-06](https://gitlab.com/anarcat/undertime/commit/0c4c2b38f32127a0dc59d2bd6e5f9db0b61ca847) |
| [whence](https://github.com/ppelleti/whence) | Print URL a file was downloaded from | [0.9.2](https://github.com/ppelleti/whence/releases/tag/0.9.2) |
{: rules="groups"}

## Disabling color in software not supporting `NO_COLOR`

{:.two_col}
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
| [Ruby IRB](https://www.ruby-lang.org/) | `echo "IRB.conf[:USE_COLORIZE] = false" >> ~/.irbrc` ([Docs](http://ruby-doc.com/stdlib-2.7.0/libdoc/irb/rdoc/IRB.html)) |
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
