---
layout: default
---

# `NO_COLOR`
### Last updated: {{ 'now' | date: "%Y-%m-%d" }}

An increasing number of command-line software programs output text with
[ANSI color](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors)
escape codes by default.
While some developers and users obviously prefer seeing these colors,
some users don't.
Unfortunately, every new piece of software seems to have a
[different way](#other)
of disabling colored text output and some software has no way at all.

Accepting the futility of trying to reverse this trend, an informal standard
was proposed in 2017:

> **Command-line software which adds ANSI color to its output by default should
check for a `NO_COLOR` environment variable that, when present and not an empty
string (regardless of its value), prevents the addition of ANSI color.**

By adopting this standard, users that prefer to have plain, non-colored text
output can export `NO_COLOR=1` to their shell's environment and automatically
disable color by default in all supported software.

If your software outputs color by default, please consider not doing so.
If you insist, please implement this standard to make it easy for your
users to disable color and then add your software to this list by
[submitting a pull request](https://github.com/jcs/no_color).

If your software does not output color by default, you do not need to bother
with this standard.

## Example Implementation

	#include <stdbool.h>
	#include <stdio.h>
	#include <stdlib.h>

	int
	main(int argc, char *argv[])
	{
		char *no_color = getenv("NO_COLOR");
		bool color = true;

		if (no_color != NULL && no_color[0] != '\0')
			color = false;

		/* do getopt(3) and/or config-file parsing to possibly turn color back on */
		...
	}

## Frequently Asked Questions

1. **Why not just set `$TERM` to `dumb` or `xterm` without color support?
Or change all color definitions in the terminal to print the same color?**

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
in the presence of `NO_COLOR`?**

	User-level configuration files and per-instance command-line arguments
	should override the `NO_COLOR` environment variable.
	A user should be able to export `NO_COLOR=1` in their shell configuration
	file as a default, but configure a specific program in its configuration
	file to specifically enable color.

	This also means that software that *can* add color but doesn't by default
	does not need to care about `NO_COLOR`, because it will only ever be
	adding color when instructed to do so (as it should be).

3. **Should the presence of `NO_COLOR` disable other styling such as bold,
underline, and italic?**

	No.
	This standard only signals the user's intention regarding adding ANSI color
	to text output.

## Color libraries supporting `NO_COLOR` to disable default color output

Software using these libraries to output color inherently support disabling
color by default via `NO_COLOR`.

| Software | Language | Description | Date / Version Supported |
|:-|:-|:-|:-|
| [ansis](https://github.com/webdiscus/ansis) | JavaScript | ANSI 256/truecolor styling of text in Node.js | [2021-12-28 / 1.2.2](https://github.com/webdiscus/ansis/releases/tag/v1.2.2) |
| [asai](https://github.com/RedPRL/asai) | OCaml | Compiler diagnostics | [2023-11-03 / 0.3.0](https://github.com/RedPRL/asai/releases/tag/0.3.0) |
| [AshConsoleGraphics](https://github.com/siljamdev/AshConsoleGraphics) | .NET | Graphics and interactive interfaces in the terminal | [2025-03-04 / 2.0.0](https://github.com/siljamdev/AshConsoleGraphics/commit/1f4b6fd72e51f70b0e0cdcd53830daeea80ed05e) |
| [AshLib](https://github.com/siljamdev/AshLib) | .NET | ANSI text formatting & more utilities | [2025-05-07 / 3.2.3](https://github.com/siljamdev/AshLib/commit/d48717d0e60353b539cc615aa766d26297cd2641) |
| [Bashkit](https://bashkit.wuage.io) | Bash | Scripting model and framework | [2023-01-27 / 1.2301.32](https://github.com/Wuageorg/bashkit/blob/e99a907f538db88cf8de1a354e5c87b21e27fcea/CHANGELOG.md) |
| [bitstring](https://github.com/scott-griffiths/bitstring) | Python | Efficient and flexible handling of binary data | [2024-04-22 / 4.2.0](https://github.com/scott-griffiths/bitstring/blob/fc3c11eef79de27eca25c7516c3549615c378fd7/release_notes.txt) |
| [cfonts](https://github.com/dominikwilkowski/cfonts) | Rust, JavaScript | Colorful fonts in the console | [2022-05-28 / 3.0.0](https://github.com/dominikwilkowski/cfonts/releases/tag/v3.0.0-nodejs) |
| [chronicles](https://github.com/status-im/nim-chronicles) | Nim | Structured logging framework with console support | [2025-07-24 / 0.12.0](https://github.com/status-im/nim-chronicles/releases/tag/v0.12.0) |
| [Cleo](https://github.com/python-poetry/cleo) | Python | Beautiful and testable command-line interfaces | [2021-01-29 / 1.0.0a1](https://github.com/python-poetry/cleo/releases/tag/1.0.0a1) |
| [cli-color](https://github.com/medikoo/cli-color) | JavaScript | Colors and formatting | [2019-10-09 / 2.0.0](https://github.com/medikoo/cli-color/releases/tag/v2.0.0) |
| [click-extra](https://github.com/kdeldycke/click-extra) | Python | Utilities for Click, the Python CLI framework | [2022-04-11 / 2.0.0](https://github.com/kdeldycke/click-extra/blob/main/changelog.md#gh200-2022-04-11-comparev190v200) |
| [cligen](https://github.com/c-blake/cligen) | Nim | Library to infer/generate command-line-interfaces | [2020-05-04 / 0.9.46](https://github.com/c-blake/cligen/commit/cb54c6e7b426c9ef96ac94c7ffb7bc2ba9254b4f) |
| [ColorDebug](https://github.com/roboticslab-uc3m/color-debug) | C, C++ | Colorful command line output macros | [2019-02-09](https://github.com/roboticslab-uc3m/color-debug/commit/2e2a5bf5a202228985612008967fb63ba8be53d8) |
| [colored](https://github.com/mackwic/colored) | Rust | Coloring terminal output | [2019-01-05 / 1.7.0](https://github.com/mackwic/colored/blob/master/CHANGELOG.md#170-january-2019) |
| [coloredstrings](https://github.com/samedit66/coloredstrings) | Python | Colors & styles for text | [2025-10-05 / 2.1.0](https://github.com/samedit66/coloredstrings/releases/tag/v2.1.0) |
| [Colorette](https://github.com/jorgebucaran/colorette) | JavaScript | Terminal text color & styles | [2021-09-17 / 2.0.0](https://github.com/jorgebucaran/colorette/releases/tag/2.0.0) |
| [colors-option](https://github.com/ehmicky/colors-option) | JavaScript | Colors and formatting based on chalk | [2021-03-02 / 1.0.0](https://github.com/ehmicky/colors-option/blob/master/CHANGELOG.md#100) |
| [colour](https://github.com/Fraser999/colour) | Rust | Macros for creating colored console output | [2024-05-13 / 2.0.0](https://github.com/Fraser999/Colour/blob/master/CHANGELOG.md#200---2024-05-13) |
| [console-ansi](https://github.com/dmnsgn/console-ansi) | JavaScript | Console coloring and prefixing via Proxy object with ANSI strings | [2022-06-14 / 1.3.0](https://github.com/dmnsgn/console-ansi/blob/main/CHANGELOG.md#130-2022-06-14) |
| [crayon](https://github.com/r-lib/crayon) | R | Colored terminal output | [2018-02-08 / 1.5.1](https://github.com/r-lib/crayon/commit/700800135d04408bf1c99426b3fec9a4073b8a97) |
| [crayon.js](https://github.com/crayon-js/crayon) | JavaScript, TypeScript | Terminal styling | [2020-04-10 / 1.0.0](https://github.com/crayon-js/crayon/commit/c7f8b1c4a1acecd93592bd330c04da70c0dc7051) |
| [crossterm](https://github.com/crossterm-rs/crossterm) | Rust | Cross-platform terminal manipulation | [2023-08-06 / 0.27](https://github.com/crossterm-rs/crossterm/releases/tag/0.27.0) |
| [crystal-lang colorize module](https://crystal-lang.org/) | Crystal | Alter text colors and decorations in terminal displays | [2022-06-06 / 1.5.0](https://github.com/crystal-lang/crystal/releases/tag/1.5.0) |
| [Dahlia](https://github.com/trag1c/Dahlia) | Python | Simple text formatting package, inspired by Minecraft | [2022-09-24 / 2.0.0](https://github.com/trag1c/Dahlia/commit/c90912d19c4e03bb8144cd2ddf4ba59499daae2d) |
| [darvil82.terminal-text-formatter](https://github.com/darvil82/java-terminal-text-formatter) | Java | TextFormatter utility to easily color and format text | [2024-03-11 / 2.1.0](https://github.com/darvil82/java-terminal-text-formatter/releases/tag/2.1.0) |
| [Dye](https://github.com/dduan/Dye) | Swift | Cross-platform terminal styling | [2020-06-01 / 0.0.1](https://github.com/dduan/Dye/releases/tag/0.0.1) |
| [Fude](https://github.com/msanguineti/fude) | JavaScript | Terminal text style formatting | [2022-06-29 / 3.0.0](https://github.com/msanguineti/fude/releases/tag/v3.0.0) |
| [Gapotchenko. FX.Console](https://github.com/gapotchenko/Gapotchenko.FX/tree/master/Source/Gapotchenko.FX.Console) | .NET | Virtual terminal functionality, console traits, and useful primitives | [2020-01-15 / 2020.1.15](https://github.com/gapotchenko/Gapotchenko.FX/releases/tag/v2020.1.15) |
| [gchalk](https://github.com/jwalton/gchalk) | Go | Terminal string styling with Windows 10 support | [2021-10-06 / 1.1.1](https://github.com/jwalton/gchalk/commit/f82cbdf7a0a48be8a91f9da03a253a7e47b5e40d) |
| [Getopt::EX::Colormap](https://metacpan.org/release/Getopt-EX) | Perl | ANSI terminal color and command line option handling | [2021-09-27 / 1.25.0](https://metacpan.org/changes/release/UTASHIRO/Getopt-EX-v1.25.0) |
| [gleamy_lights](https://github.com/strawmelonjuice/gleamy_lights) | Gleam->Erlang, Gleam->Javascript | Colored console output for Gleam | [2024-09-27 / 2.0.2](https://github.com/strawmelonjuice/gleamy_lights/blob/master/changelog.md#202) |
| [GLib](https://docs.gtk.org/glib/) | C | Low-level core library that forms the basis for projects such as GTK and GNOME | [2025-11-05 / 2.87.1](https://gitlab.gnome.org/GNOME/glib/-/commit/a53df3a4b8668196c4538442c702fe40492d54ae) |
| [GNU libtextstyle](https://www.gnu.org/software/gettext/libtextstyle/manual/libtextstyle.html) | C | Library for styling text output with CSS | [2019-08-13 / 0.21](https://github.com/autotools-mirror/gettext/commit/7040b13946b3dce5fbe2be8ecfda11e03eed7028) |
| [go-ansi](https://git.sr.ht/~mpldr/go-ansi/) | Go | Easy text formatting | [2021-05-18 / 1.4.0](https://git.sr.ht/~mpldr/go-ansi/commit/5d3db1d715a4ab8b00dda60b9b87054a4146c1aa) |
| [inquire](https://github.com/mikaelmello/inquire) | Rust | Build interactive prompts | [2021-08-29 / 0.0.10](https://github.com/mikaelmello/inquire/releases/tag/v0.0.10) |
| [kleur](https://github.com/lukeed/kleur) | JavaScript | Format terminal text with ANSI colors | [2020-08-12 / 4.1.0](https://github.com/lukeed/kleur/releases/tag/v4.1.0) |
| [LogColor](https://github.com/induane/logcolor) | Python | Color output in log messages | [2018-01-24 / 1.2.0](https://github.com/induane/logcolor/commit/0092b0af2a1506eee2b0ca028b1cf51f78fc91fa) |
| [MatthiWare. CommandLineParser](https://github.com/MatthiWare/CommandLineParser.Core) | C# | Command Line Parser | [2020-07-21 / 0.3.1](https://github.com/MatthiWare/CommandLineParser.Core/commit/240154043afadee1a581866f537b22048d2f69bc) |
| [Nano Colors](https://github.com/ai/nanocolors) | JavaScript | Format terminal text with ANSI colors | [2021-09-21 / 0.1.0](https://github.com/ai/nanocolors/releases/tag/0.1.0) |
| [NetAF](https://github.com/benpollarduk/NetAF) | .NET | Text adventure framework | [2024-12-03 / 2.9.6](https://github.com/benpollarduk/NetAF/releases/tag/2.9.6) |
| [NLog](https://github.com/NLog/NLog) | .NET | Logging framework | [2025-02-05 / 5.4.0](https://github.com/NLog/NLog/releases/tag/v5.4.0) |
| [oigiki](https://github.com/0xf0xx0/oigiki) | Go | ANSI color tagging lib | [2025-12-20 / 2.0.0](https://github.com/0xf0xx0/oigiki/tree/v2.0.0) |
| [paint](https://github.com/janlelis/paint) | Ruby | Terminal colors and effects | [2020-02-21 / 2.2.0](https://github.com/janlelis/paint/tree/v2.2.0) |
| [pastel](https://github.com/piotrmurach/pastel) | Ruby | Terminal output styling | [2020-07-04 / 0.8.0](https://github.com/piotrmurach/pastel/releases/tag/v0.8.0) |
| [Pastel](https://github.com/silkfire/Pastel) | .NET | Color console output | [2019-03-17 / 1.2.0](https://github.com/silkfire/Pastel/commit/8a89c2930a2b7ff2c6beae67e6c00fe1d74189d5) |
| [pfetch](https://github.com/silkfire/Pastel) | Shell | Pretty system information | [2024-08-01](https://github.com/Un1q32/pfetch/commit/efa9b369b467934e168cd26f69bbd4661e29e065) |
| [php-cli](https://github.com/splitbrain/php-cli) | PHP | PHP library to build command line tools | [2024-12-03 / 1.3.2](https://github.com/splitbrain/php-cli/commit/360ed0b3704fa8fcd1ce976ed79012aa2c67d22f) |
| [pretty](https://github.com/clj-commons/pretty) | Clojure | Library for helping print things prettily | [2023-07-20 / 2.0](https://github.com/clj-commons/pretty/releases/tag/2.0) |
| [PyTermGUI](https://github.com/bczsalba/pytermgui/) | Python | TUI framework | [2022-03-21 / 4.2.0](https://github.com/bczsalba/pytermgui/releases/tag/v4.2.0) |
| [rich](https://github.com/Textualize/rich) | Python | Rich text and beautiful formatting | [2022-02-08 / 11.2.0](https://github.com/Textualize/rich/releases/tag/v11.2.0) |
| [sgr](https://github.com/datafl4sh/sgr) | C++ | Stream manipulators for colored text output | [2022-02-28](https://github.com/datafl4sh/sgr/commit/a9fede27b1966e0104567541535fd40c9c7b6ef3) |
| [Spectre.Console](https://github.com/spectreconsole/spectre.console) | .NET | Create beautiful console applications | [2020-07-21 / 0.1.0](https://github.com/spectreconsole/spectre.console/commit/334dcddc1aa62953ad6c2190344bf5b94820614c) |
| [System.Console](https://learn.microsoft.com/en-us/dotnet/api/system.console) | .NET | Represents the standard input, output, and error streams for console applications | [2021-07-10 / .NET 6](https://github.com/dotnet/runtime/commit/0d848f68b46cd34bca7f64b11b79057f4b7bfad5) |
| [Term::ANSIColor](https://metacpan.org/release/Term-ANSIColor) | Perl | Color output using ANSI escape sequences | [2020-01-17 / 5.01](https://metacpan.org/changes/release/RRA/Term-ANSIColor-5.01) |
| [termcolor](https://github.com/BurntSushi/termcolor) | Rust | Cross-platform terminal colors | [2020-01-11 / 1.1.0](https://github.com/BurntSushi/termcolor/commit/423e28eb69a77799179474575869c5b0433d6adb) |
| [termcolor](https://github.com/termcolor/termcolor) | Python | ANSI color formatting in the terminal | [2022-09-11 / 2.0.0](https://github.com/termcolor/termcolor/releases/tag/2.0.0) |
| [termenv](https://github.com/muesli/termenv) | Go | Text styling, terminal detection and color conversions | [2021-06-24 / 0.9.0](https://github.com/muesli/termenv/releases/tag/v0.9.0) |
| [TextOutput](https://github.com/xyproto/textoutput) | Go | Control text output using VT100 terminal codes | [2019-11-18 / 1.9.1](https://github.com/xyproto/textoutput/tree/v1.9.1) |
| [textus_coloris](https://github.com/ac000/textus_coloris) | C | Colourised console output | [2021-08-16](https://github.com/ac000/textus_coloris/commit/4930b7a531beebf772f82b3dbaa60d0a47d50c1b) |
| [Warna](https://github.com/komothecat/warna) | Lua | Terminal text styling | [2024-02-11 / 0.1.0](https://github.com/komothecat/warna/releases/tag/v0.1.0-1) |
| [XConsole](https://github.com/chubrik/XConsole) | .NET | Coloring, pinning & positioning | [2022-04-22 / 1.0.5](https://github.com/chubrik/XConsole/releases/tag/1.0.5) |
{: rules="groups"}

## Software directly supporting `NO_COLOR` to disable color output by default

| Software | Description | Date / Version Supported |
|:-|:-|:-|
| [alogview](https://github.com/flimberger/alogview) | Android logcat Filter | [2018-10-31](https://github.com/flimberger/alogview/commit/785e5608711d92a1c41733f9ecfa3ed2d335a940) |
| [Ammonite](https://github.com/lihaoyi/Ammonite) | Scala Scripting | [2017-07-03 / 1.0.0](https://github.com/lihaoyi/Ammonite/releases/tag/1.0.0) |
| [Ansible](https://github.com/ansible/ansible) | IT automation system | [2021-04-26 / 2.11.0](https://github.com/ansible/ansible/blob/stable-2.11/changelogs/CHANGELOG-v2.11.rst#v2-11-0) |
| [Ansible Navigator](https://github.com/ansible/ansible-navigator) | IT automation interface | [2021-10-13 / 1.1.0](https://github.com/ansible/ansible-navigator/releases/tag/1.1.0) |
| [Apt](https://tracker.debian.org/pkg/apt) | Debian Package manager | [2021-10-10 / 2.3.11](http://metadata.ftp-master.debian.org/changelogs/main/a/apt/unstable_changelog) |
| [Archey 4](https://github.com/HorlogeSkynet/archey4) | Python system information tool | [2020-09-26 / 4.8.0](https://github.com/HorlogeSkynet/archey4/releases/tag/v4.8.0) |
| [Arduino CLI](https://github.com/arduino/arduino-cli) | Arduino command line tool  | [2021-09-02 / 0.19.0](https://github.com/arduino/arduino-cli/releases/tag/0.19.0) |
| [Aurornis](https://github.com/Deuchnord/Aurornis) | Library to simplify command line programs testing | [2021-11-16 / 1.2.0](https://github.com/Deuchnord/Aurornis/releases/tag/v1.2.0) |
| [Bashly](https://bashly.dannyb.co/) | Bash command line framework and CLI generator  | [2021-10-26 / 0.6.9](https://github.com/DannyBen/bashly/releases/tag/v0.6.9) |
| [bat](https://github.com/sharkdp/bat) | cat(1) clone with syntax highlighting and Git integration | [2020-10-02 / 0.16.0](https://github.com/sharkdp/bat/releases/tag/v0.16.0) |
| [beets](https://github.com/beetbox/beets) | Music library manager and MusicBrainz tagger | [2019-05-30 / 1.4.9](https://github.com/beetbox/beets/releases/tag/v1.4.9) |
| [bfs](https://github.com/tavianator/bfs) | Breadth-first version of the UNIX find command | [2019-05-06 / 1.4.1](https://github.com/tavianator/bfs/releases/tag/1.4.1) |
| [Bibtex autocomplete](https://github.com/dlesbre/bibtex-autocomplete) | Autocomplete bibtex entries using online data | [2025-03-03 / 1.4.1](https://github.com/dlesbre/bibtex-autocomplete/releases/tag/v1.4.1) |
| [Bikeshed](https://github.com/tabatkins/bikeshed) | Spec/Document Processor | [2018-07-27 / 0.9](https://github.com/tabatkins/bikeshed/commit/04ea123d607a8d4bed692ad73dda1cb343bb5bbe) |
| [bl-agent-debater](https://github.com/beyond-logic-labs/bl-agent-debater) | CLI tool for structured debates between AI agents | [2025-12-31](https://github.com/beyond-logic-labs/bl-agent-debater/commit/main) |
| [blocky](https://github.com/0xERR0R/blocky) | Fast and lightweight DNS proxy | [2025-11-04 / 0.28.0](https://github.com/0xERR0R/blocky/commit/ac8ca7dc1f4671ae189ef187d3cbf1befc247a00) |
| [Bloop](https://github.com/scalacenter/bloop) | Compilation/test server for Scala and Java | [2018-07-02 / 1.5.3](https://github.com/scalacenter/bloop/pull/555/commits/ff6f17a0155633f86440e10d7889f077e7fbc91c) |
| [borgmatic](https://torsion.org/borgmatic) | Simple, configuration-driven backup software | [2024-03-04 / 1.8.9](https://projects.torsion.org/borgmatic-collective/borgmatic/commit/16bc0de3fb76f027c81353899d4e7a4d6b386dbc) |
| [buildkit](https://github.com/moby/buildkit) | Concurrent, cache-efficient, Dockerfile-agnostic builder toolkit | [2022-07-20](https://github.com/moby/buildkit/commit/ebb1e827178a763f7f1150fc5a80a9b4f993d02f) |
| [Bullseye](https://github.com/adamralph/bullseye) | .NET library for running a target dependency graph | [2021-01-01 / 3.6.0](https://github.com/adamralph/bullseye/blob/master/CHANGELOG.md#360) |
| [c-ray](https://github.com/vkoskiv/c-ray) | The small C raytracer | [2021-09-24](https://github.com/vkoskiv/c-ray/commit/cd321107a650c68bfa62911f8baf691397e28898) |
| [Cake](https://cakebuild.net) | Cross-platform build automation system with a C# DSL | [2021-03-06 / 1.1.0](https://cakebuild.net/docs/running-builds/configuration/default-configuration-values#disable-colors-in-output-text) |
| [CakePHP](https://github.com/cakephp/cakephp) | Full stack framework for PHP | [2019-12-30 / 4.0.1](https://github.com/cakephp/cakephp/pull/14158) |
| [Candalf](https://github.com/jarmo/candalf) | Orchestrate system configuration/setup/management | [2022-03-22](https://github.com/jarmo/candalf/commit/54678fb7730fe803927f3831fec7280e69e5aca1) |
| [cdist](https://www.cdi.st/) | Usable configuration management | [2020-06-17 / 6.6.0](https://code.ungleich.ch/ungleich-public/cdist/-/releases/6.6.0) |
| [ceccomp](https://github.com/dbgbgtf1/Ceccomp) | A tool to resolve seccomp just like seccomp-tools | [2025-11-06 / 3.4](https://github.com/dbgbgtf1/Ceccomp/commit/2c07b7d05192bd303dd9df333404fd4b28995323) |
| [checkit](https://gitgud.io/BoraxMan/checkit) | File integrity tool for Linux and Unix systems | [2022-09-08 / 0.5.1](https://gitgud.io/BoraxMan/checkit/-/tags/v0.5.1) |
| [chezmoi](https://chezmoi.io/) | Manage dotfiles across multiple machines, securely | [2020-05-06 / 1.8.1](https://github.com/twpayne/chezmoi/releases/tag/v1.8.1) |
| [Clang](https://clang.llvm.org/) | C compiler | [2023-09-19 / 17.0.1](https://github.com/llvm/llvm-project/releases/tag/llvmorg-17.0.1) |
| [CliFM](https://github.com/leo-arch/clifm) | The command line file manager | [2021-14-12 / 1.7](https://github.com/leo-arch/clifm/commit/c9e0a1384c8f410922731341a3e8ebfe8b98ec27) |
| [Clipboard](https://github.com/Slackadays/Clipboard) | The cut, copy, and paste system for the terminal | [2022-12-04 / 0.1.2](https://github.com/Slackadays/Clipboard/commit/79db7ced8fc6c56f79db6555775a470d0e30616e) |
| [Composer](https://getcomposer.org/) | PHP package manager | [2020-01-14 / 1.9.2](https://github.com/composer/composer/pull/8417) |
| [Cras](https://sr.ht/~arivigo/cras/) | Cras: The Anti-Procrastination Tool | [2020-06-05 / 0.1.0](https://git.sr.ht/~arivigo/cras/refs/1.0.1) |
| [Cronie](https://github.com/cronie-crond/cronie) | Cronie cron daemon project | [2021-03-19 / 1.6.1](https://github.com/cronie-crond/cronie/commit/765a745c6497f8cde51c39db7b1bb88686b90a9c) |
| [csv2db](https://csv2db.github.io/) | CSV database loading tool | [2019-09-23 / 1.4.0](https://github.com/csv2db/csv2db/releases/tag/v1.4.0) |
| [DataLad](https://www.datalad.org/) | Data management and publication multitool | [2019-05-23 / 0.11.5](https://github.com/datalad/datalad/releases/tag/0.11.5) |
| [DDEV](https://ddev.com/) | Docker-based local PHP+Node.js web development environments | [2025-07-19 / 1.24.7](https://github.com/ddev/ddev/releases/tag/v1.24.7) |
| [DDraceNetwork](https://ddnet.tw/) | Cooperative multiplayer game | [2022-02-27 / 5.1](https://github.com/ddnet/ddnet/commit/b3e7164905dd227f9ab1c0eb9d7ab878ece7e971) |
| [debian-subsystem](https://gitlab.com/sulincix/debian-subsystem) | Use Debian subsystem on other GNU/Linux distributions | [2021-11-09](https://gitlab.com/sulincix/debian-subsystem/-/commit/813292e0498800e01bd4039678511c1097c2147f) |
| [DeepfakeHTTP](https://github.com/xnbox/DeepfakeHTTP) | Web server that uses HTTP dumps as a source for responses | [2021-09-17 / 1.0.13](https://github.com/xnbox/DeepfakeHTTP/releases/tag/v1.0.13) |
| [deno](https://github.com/denoland/deno) | Secure TypeScript runtime | [2019-02-09 / 0.2.11](https://github.com/denoland/deno/releases/tag/v0.2.11) |
| [dish](https://github.com/thevxn/dish) | A lightweight, remotely configurable monitoring service | [2025-06-29 / 1.11.3](https://github.com/thevxn/dish/releases/tag/v1.11.3) |
| [Diun](https://github.com/crazy-max/diun) | Docker Image Update Notifier | [2021-05-26 / 4.17.0](https://github.com/crazy-max/diun/releases/tag/v4.17.0) |
| [elfinfo](https://github.com/xyproto/elfinfo) | Utility for displaying ELF information | [2020-01-17 / 1.0.1](https://github.com/xyproto/elfinfo/tree/1.0.1) |
| [Elixir](https://elixir-lang.org) | Dynamic, functional language | [2020-01-27 / 1.10.0](https://github.com/elixir-lang/elixir/releases/tag/v1.10.0) |
| [Elle](https://github.com/acquitelol/elle) | Statically typed compiled language | [2025-02-12](https://github.com/acquitelol/elle/commit/8872c8a582e015d2b1c50b18f460f0da63087354) |
| [Elvish](https://elv.sh) | Powerful scripting language and versatile interactive shell | [2024-02-11 / 0.20.0](https://elv.sh/blog/0.20.0-release-notes.html) |
| [enum4linux-ng](https://github.com/cddmp/enum4linux-ng) | Next generation enum4linux (Windows/Samba enumeration tool) | [2020-10-24 / 1.1.0](https://github.com/cddmp/enum4linux-ng/commit/fa8f371de9975d4613c6ed9582b26db2584d10d8) |
| [esbuild](https://github.com/evanw/esbuild) | JS/TS/CSS bundler | [2021-05-18 / 0.12.0](https://github.com/evanw/esbuild/releases/v0.12.0) |
| [exa](https://github.com/ogham/exa) | Modern replacement for ls | [2021-12-06](https://github.com/ogham/exa/commit/7c957f95b328aabe75f7494633dae5893d4ed3d1) |
| [eza](https://github.com/cafkafk/eza) | Modern, maintained replacement for ls | [2021-12-06](https://github.com/cafkafk/eza/commit/7c957f95b328aabe75f7494633dae5893d4ed3d1) |
| [F2](https://github.com/ayoisaiah/f2) | Safe and fast cross-platform bulk-rename tool | [2021-05-04 / 1.5.7](https://github.com/ayoisaiah/f2/releases/tag/v1.5.7) |
| [fast-asar](https://github.com/lafkpages/fast-asar) | A faster implementation of Electron's ASAR archive format | [2023-10-17 / 1.0.5](https://github.com/lafkpages/fast-asar/commit/10da0ea1997ef4bcc359a003852160b4343c59a0) |
| [fastlane](https://fastlane.tools) | The easiest way to build and release mobile apps | [2020-11-19 / 2.168.0](https://github.com/fastlane/fastlane/releases/tag/2.168.0) |
| [fd](https://github.com/sharkdp/fd) | Simple, fast, and user-friendly alternative to `find` | [2020-03-22 / 7.5.0](https://github.com/sharkdp/fd/releases/tag/v7.5.0) |
| [fetchcommandwrapper](https://github.com/hartwork/fetchcommandwrapper) | Integrates aria2 with `FETCHCOMMAND` of portage | [2025-06-18 / 1.0.0](https://github.com/hartwork/fetchcommandwrapper/pull/52) |
| [ffind](https://github.com/josephscade/ffind) | Rust utility to find files and folders | [2018-03-24](https://github.com/josephscade/ffind/commit/fec4aa6101f2b3d6d5b06df640e299d0b1fbb190) |
| [firefox-password-merger](https://github.com/jhinrichsen/firefox-password-merger) | Merge Firefox password CSV exports across machines | [2025-10-28 / v0.3.0](https://github.com/jhinrichsen/firefox-password-merger/commit/a11e302ae233e590bef4109eba5c12a454124aca) |
| [forest-arborist](https://github.com/JohnRGee/forest-arborist) | Manage a loosely coupled forest of git or hg repositories | [2018-04-15 / 1.2.0](https://github.com/JohnRGee/forest-arborist/releases/tag/v1.2.0) |
| [fq](https://github.com/wader/fq) | jq for binary formats | [2021-12-03 / 0.0.1](https://github.com/wader/fq/releases/tag/v0.0.1) |
| [fselect](https://github.com/jhspetersson/fselect) | Utility for finding files with SQL-like expressions | [2019-03-08 / 0.6.1](https://github.com/jhspetersson/fselect/releases/tag/0.6.1) |
| [fzf](https://github.com/junegunn/fzf) | A command-line fuzzy finder | [2024-06-06 / 0.53.0](https://github.com/junegunn/fzf/commit/aee417c46a2f6d2aa87ea3fcc799fdc7bc830dfe) |
| [gatsby-cli](https://github.com/gatsbyjs/gatsby/blob/master/packages/gatsby-cli) | GatsbyJS command line interface | [2019-08-05 / 2.20.0](https://github.com/gatsbyjs/gatsby/commit/ccebe174078529329a26350224a1a5730567c695) |
| [gex](https://github.com/Piturnah/gex) | Git TUI inspired by Magit | [2023-08-05 / 0.6.1](https://github.com/Piturnah/gex/releases/tag/v0.6.1) |
| [gh](https://github.com/cli/cli) | GitHub’s official command line tool | [2020-04-22 / 0.7.0](https://github.com/cli/cli/commit/250114e2c033bccd938f297605a915578d8af07c) |
| [ghcup](https://github.com/haskell/ghcup-hs) | Haskell toolchain installer | [2021-02-26 / 0.1.13](https://github.com/haskell/ghcup-hs/commit/a08e62430901dcc0271fa65bd96ded68b65bd152) |
| [git-delete-merged-branches](https://github.com/hartwork/git-delete-merged-branches) | Command-line tool to delete merged Git branches | [2020-06-29 / 1.2.0](https://github.com/hartwork/git-delete-merged-branches/commit/62bd406fba91e831e29663a483bfe7659b4c62f3) |
| [git-log-tree](https://github.com/xiaoshanyan9/git-log-tree) | A fancy `git log --graph` | [2025-11-13 / 1.1.0](https://github.com/xiaoshanyan9/git-log-tree/releases/tag/v1.1.0) |
| [git-subline-merge](https://github.com/paulaltin/git-subline-merge) | Git merge driver for resolving conflicts | [2019-07-27](https://github.com/paulaltin/git-subline-merge/commit/d8f738a62f96dfdf315511cece7c93526e48baef) |
| [git-task](https://github.com/jhspetersson/git-task) | Local-first task manager for git repositories with remote sync | [2024-10-02 / 0.1.1](https://github.com/jhspetersson/git-task/releases/tag/0.1.1) |
| [GNU gdb](https://www.sourceware.org/gdb/) | The GNU Debugger | [2023-09-29 / 14.1](https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=4ebfd53de03599b73838ee339e47652ac26c37c0) |
| [gocryptfs](https://github.com/rfjakob/gocryptfs) | Encrypted FUSE filesystem | [2021-12-11 / 2.3](https://github.com/rfjakob/gocryptfs/commit/a1f01419e2e6e5d637ec7afa31c0a1d95e0ea923) |
| [gojq](https://github.com/itchyny/gojq) | Pure Go implementation of jq | [2020-03-20 / 0.10.0](https://github.com/itchyny/gojq/commit/17bccf1feb25e428223a31a0cd65c2827e2ef0c1) |
| [gopass](https://github.com/gopasspw/gopass) | Password store for teams | [2018-06-06 / 1.8.0](https://github.com/gopasspw/gopass/releases/tag/v1.8.0) |
| [gplaces](https://github.com/dimkr/gplaces) | Simple terminal based Gemini client | [2022-06-05 / 0.16.19](https://github.com/dimkr/gplaces/commit/c907bdf719ad069da2f75daf01f371921f5fde0f) |
| [GraalVM Native Image](https://www.graalvm.org/native-image/) | Compile Java applications ahead-of-time into binaries | [2022-02-28 / 22.1.0](https://github.com/oracle/graal/commit/20f912e13cd97c3c3b527522b194a61eac71a93b) |
| [gwen](https://github.com/gwen-interpreter/gwen) | Automation and robotics for Gherkin | [2021-11-16 / 3.0.0](https://github.com/gwen-interpreter/gwen/releases/tag/v3.0.0) |
| [h5glance](https://github.com/European-XFEL/h5glance) | HDF5 file viewer | [2024-11-19 / 0.9](https://github.com/European-XFEL/h5glance/blob/master/CHANGES.rst) |
| [Hajime](https://github.com/Slackadays/Hajime) | Advanced Minecraft server wrapper | [2022-02-27](https://github.com/Slackadays/Hajime/commit/7ff89c1d29d901ab0dc47474ee85619fbfbbd226) |
| [Homebrew](https://brew.sh/) | Package manager for macOS | [2018-02-27 / 1.5.5](https://github.com/Homebrew/brew/releases/tag/1.5.5) |
| [Hono](https://github.com/honojs/hono) | JavaScript framework built on Web Standards | [2024-03-12 / 4.1.0](https://github.com/honojs/hono/releases/tag/v4.1.0) |
| [Hspec](https://hspec.github.io/) | Testing framework for Haskell | [2021-05-12 / 1.8.1](https://github.com/hspec/hspec/blob/main/CHANGES.markdown#changes-in-281) |
| [htmltest](https://github.com/wjdp/htmltest) | Tests generated HTML for issues | [2021-01-16 / 0.14.0](https://github.com/wjdp/htmltest/releases/tag/v0.14.0) |
| [Hugo](https://github.com/gohugoio/hugo) | Framework for building websites | [2022-06-16 / 0.101.0](https://github.com/gohugoio/hugo/releases/tag/v0.101.0) |
| [Hurl](https://hurl.dev) | Run and test HTTP requests with plain text and curl | [2022-09-13 / 1.7.0](https://github.com/Orange-OpenSource/hurl/releases/tag/1.7.0) |
| [hx](https://github.com/sitkevij/hex) | Futuristic take on hexdump, made in Rust | [2020-11-22 / 0.4.0](https://github.com/sitkevij/hex/releases/tag/v0.4.0) |
| [inary](https://gitlab.com/sulinos/devel/inary) | Package manager for SulinOS | [2021-10-18](https://gitlab.com/sulinos/devel/inary/-/commit/29cbfcd8a8b50683d6726fd7b060af005d1b9c80) |
| [ipcalc](https://gitlab.com/ipcalc/ipcalc) | A modern IPv4/IPv6 ipcalc tool | [2025-05-01](https://gitlab.com/ipcalc/ipcalc/-/commit/adcdaa3e14b704b217f4b9b7062ee32db082c99f) |
| [irb](https://github.com/ruby/irb) | Official Ruby REPL | [2021-06-21 / 1.3.6](https://github.com/ruby/irb/releases/tag/v1.3.6) |
| [jc](https://github.com/kellyjonbrazil/jc) | Convert output of command-line tools and file-types to JSON | [2021-12-07 / 1.17.4](https://github.com/kellyjonbrazil/jc/releases/tag/v1.17.4) |
| [jello](https://github.com/kellyjonbrazil/jello) | Filter JSON and JSON Lines data with Python syntax | [2021-12-08 / 1.5.0](https://github.com/kellyjonbrazil/jello/releases/tag/v1.5.0) |
| [jq](https://github.com/jqlang/jq) | Lightweight and flexible command-line JSON processor | [2023-09-06 / 1.7](https://github.com/jqlang/jq/releases/tag/jq-1.7) |
| [jqjq](https://github.com/wader/jqjq) | jq implementation of jq | [2024-02-07](https://github.com/wader/jqjq/pull/14) |
| [KBSecret](https://kbsecret.github.io/) | Secret manager backed by Keybase and KBFS | [2018-04-13 / 1.4.0](https://github.com/kbsecret/kbsecret/commit/d5296054d979a1b1ce07c1be78d56d3d29b62384) |
| [Kibi](https://github.com/ilai-deutel/kibi) | Featureful text editor in ≤1024 lines of Rust | [2025-11-23 / 0.3.2](https://github.com/ilai-deutel/kibi/releases/tag/v0.3.2) |
| [kitten](https://github.com/hoffa/kitten) | Tiny multi-server automation tool | [2018-06-06 / 0.2.14](https://github.com/hoffa/kitten/commit/88cb015f4ae021a1c00bfc4dc9506a8e14e51bb4) |
| [konch](https://github.com/sloria/konch) | Python shell/REPL configuration tool | [2019-01-19 / 4.0.0](https://github.com/sloria/konch/blob/master/CHANGELOG.rst#400-2019-01-19) |
| [lakeFS](https://github.com/treeverse/lakefs) | Manage data as code using Git-like operations | [2023-07-10 / 0.109.0](https://github.com/treeverse/lakeFS/releases/tag/v0.109.0) |
| [lat](https://github.com/secondary-smiles/lat) | Fast file viewer and text formatter | [2023-04-20 / 0.3.2](https://github.com/secondary-smiles/lat/releases/tag/v0.3.2) |
| [lbt](https://gitlab.com/gardenappl/lbt) | Friendly tools for interacting with the LBRY network | [2022-03-31 / 2.1.2](https://gitlab.com/gardenappl/lbt/-/releases/v2.1.2) |
| [lc](https://github.com/c-blake/lc) | Multi-dimensional, abbreviating ls/file lister in Nim | [2019-11-18 / 0.9.1](https://github.com/c-blake/lc/commit/3f69e692db45c63320c3cbd2d3910208437687f9) |
| [LicensePlist](https://github.com/mono0926/LicensePlist) | License list generator for Apple developer | [2022-09-20 / 3.23.3](https://github.com/mono0926/LicensePlist/releases/tag/3.23.3) |
| [Lintian](https://lintian.debian.org) | Friendly packaging advice for Debian contributors | [2021-12-12 / 2.114.87](https://salsa.debian.org/lintian/lintian/-/commit/275a48e628120100a38cbcd5a4f7f5b70c5ab47d) |
| [lr](https://github.com/chneukirchen/lr) | File list generator | [2018-01-29 / 1.5.1](https://github.com/chneukirchen/lr/commit/8f0ac7c8abb4e0830d6cf72bbbd5f38c44b4266d) |
| [lsd](https://github.com/Peltoche/lsd) | The next gen ls command | [2022-01-16 / 0.21.0](https://github.com/Peltoche/lsd/releases/tag/0.21.0) |
| [mblaze](https://github.com/chneukirchen/mblaze) | Unix utilities to deal with Maildir | [2018-01-29 / 1.2](https://github.com/chneukirchen/mblaze/commit/4014f03afe6d624ba1c6bdde6551b4996ba31fe5) |
| [meli](https://meli.delivery) | Terminal mail client in Rust | [2019-01-27 / 0.7.2](https://github.com/meli/meli/commit/6a7cae09882d43c0de8a84df3d66174949ede0e0) |
| [Meltano](https://github.com/meltano/meltano) | Data ingestion, transformation, and management | [2022-11-08 / 2.9.0](https://github.com/meltano/meltano/releases/tag/v2.9.0) |
| [memy](https://github.com/andrewferrier/memy) | Manage frequently used files and dirs from the CLI | [2025-11-12 / 0.15.0](https://github.com/andrewferrier/memy/releases/tag/v0.15.0) |
| [Microfetch](https://github.com/NotAShelf/Microfetch) | Very fetch tool in Rust for NixOS systems | [2024-12-19 / 0.4.3](https://github.com/NotAShelf/microfetch/releases/tag/v0.4.3) |
| [Middleman](https://middlemanapp.com) | Ruby-based static site generator | [2019-02-18 / 5.0.0](https://github.com/middleman/middleman/commit/3040ffa1331aa48c76ae5ca7f4b2e0a0f1b7af15) |
| [mmCEsim](https://mmcesim.org) | Millimeter Wave Channel Estimation Simulation | [2023-03-31 / 0.2.1](https://github.com/mmcesim/mmcesim/releases/tag/v0.2.1) |
| [Modules](http://modules.sourceforge.net/) | Dynamic modification of one's environment | [2020-04-07 / 4.5.0](https://github.com/cea-hpc/modules/releases/tag/v4.5.0) |
| [mu](https://www.djcbsoftware.nl/code/mu/) | Maildir indexer/searcher | [2019-02-02 / 1.8.10](https://github.com/djcb/mu/commit/eb6efee81db22531ef05e140549bde7e87dd9725) |
| [Nette Tester](https://tester.nette.org/) | Testing library for PHP | [2020-08-03 / 2.3.3](https://github.com/nette/tester/releases/tag/v2.3.3) |
| [newsraft](https://codeberg.org/grisha/newsraft) | Feed reader for terminal | [2022-08-14 / 0.8](https://codeberg.org/grisha/newsraft/releases/tag/newsraft-0.8) |
| [NGLess](http://ngless.embl.de/) | Domain specific language for bioinformatics | [2018-10-29 / 1.5.0](https://github.com/ngless-toolkit/ngless/commit/15926150701100ff96b4a7cd1f3142f9a272b983) |
| [Nix](https://nixos.org/) | The purely functional package manager | [2021-11-01 / 2.4.0](https://github.com/NixOS/nix/pull/4971) |
| [nnn](https://github.com/jarun/nnn) | File manager | [2020-04-05 / 4.6](https://github.com/jarun/nnn/commit/f14fb9c0f92c25ab79dd0c47d16f075199aeb999) |
| [noether](https://github.com/yunruse/noether) | Unit catalogue and calculator for Python | [2023-08-02 / 1.1](https://github.com/yunruse/Noether/releases/tag/v1.1) |
| [nostt](https://github.com/sjmulder/nostt) | Teletext reader | [2023-08-03 / 1.3](https://github.com/sjmulder/nostt/releases/tag/1.3) |
| [Nox](https://github.com/wntrblm/nox) | Flexible test automation | [2019-04-11 / 2019.4.11](https://github.com/wntrblm/nox/releases/tag/2019.4.11) |
| [npm](https://www.npmjs.com/) | Package manager for JavaScript | [2018-03-24 / 5.8.0](https://github.com/npm/npm/releases/tag/v5.8.0) |
| [nvh](https://github.com/JohnRGee/nvh) | Node Version Helper | [2018-08-04 / 4.1.0](https://github.com/JohnRGee/nvh/releases/tag/v4.1.0) |
| [o](https://github.com/xyproto/o) | Small, fast, and limited text editor | [2020-01-06 / 2.13.2](https://github.com/xyproto/o/tree/2.13.2) |
| [OCaml compiler](https://github.com/ocaml/ocaml) | The OCaml programming language compiler | [2022-03-28 / 4.14.0](https://github.com/ocaml/ocaml/blob/4.14.0/Changes#L207-L210) |
| [Octopus Deploy CLI](https://github.com/OctopusDeploy/cli) | Command Line Interface for Octopus Deploy | [2022-11-23 / 0.6.0](https://github.com/OctopusDeploy/cli/tree/v0.6.0) |
| [opass](https://github.com/wiremoons/opass) | Offer password suggestions | [2021-06-12 / 0.9.1](https://github.com/wiremoons/opass/commit/02c593d510b23a1b8e5af40d04a475eeb5755491) |
| [ouch](https://github.com/ouch-org/ouch) | Painless CLI compression and decompression | [2021-09-17 / 0.3.1](https://github.com/ouch-org/ouch/commit/b099e4ac206d09d345315a01688e31493c0e141a) |
| [Pacstall](https://pacstall.dev) | AUR-inspired package manager for Ubuntu | [2023-02-27 / 3.7.0](https://github.com/pacstall/pacstall/releases/tag/3.7.0) |
| [picocli](https://github.com/remkop/picocli/) | Tiny Java command line interface | [2019-01-05 / 3.9.0](https://github.com/remkop/picocli/releases/tag/v3.9.0#3.9.0-ANSI-heuristics) |
| [pipewire](https://pipewire.org/) | PipeWire multimedia server | [2021-03-13 / 0.3.24](https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/c974318686ced66546861494509d2ee93fc110d9) |
| [Planck](https://planck-repl.org/) | Stand-alone ClojureScript REPL | [2019-05-19 / 2.23.0](https://github.com/planck-repl/planck/releases/tag/2.23.0) |
| [Poe the Poet](https://github.com/nat-n/poethepoet) | A task runner that works well with poetry or uv | [2023-09-23 / v0.23.0](https://github.com/nat-n/poethepoet/releases/tag/v0.23.0) |
| [Poetry](https://github.com/python-poetry/poetry) | Dependency management and packaging in Python | [2021-05-21 / 1.2.0a1](https://github.com/python-poetry/poetry/releases/tag/1.2.0a1) |
| [PowerShell](https://microsoft.com/PowerShell) | Shell and scripting language | [2021-11-08 / 7.2.0](https://docs.microsoft.com/powershell/scripting/whats-new/what-s-new-in-powershell-72) |
| [procs](https://github.com/c-blake/procs) | Process and system query and formatting | [2019-11-18 / 0.4.0](https://github.com/c-blake/procs/commit/7d19fc184f8c29481dd5a4c4d5d26c671c2c0a4c) |
| [pulumi](https://pulumi.io/) | Programming-language-based IaC framework | [2018-06-04 / 0.14.3](https://github.com/pulumi/pulumi/pull/1594) |
| [pwndbg](https://github.com/pwndbg/pwndbg) | A GDB and LLDB plug-in that makes debugging suck less | [2025-08-16 / 2025.10.10](https://github.com/pwndbg/pwndbg/pull/3239) |
| [PyDERASN](http://www.pyderasn.cypherpunks.ru/) | Python ASN.1 DER/CER/BER library | [2018-02-14 / 3.1](http://www.git.cypherpunks.ru/?p=pyderasn.git;a=commitdiff;h=54876436a23f14951f2e6353e9072c9a098b35b4) |
| [pydf](https://github.com/garabik/pydf) | df(1) clone with colour output | [2025-11-27 / 15.0.0](https://github.com/garabik/pydf/pull/18) |
| [pytest](https://pytest.org) | Python testing framework | [2020-07-28 / 6.0.0](https://docs.pytest.org/en/stable/changelog.html#pytest-6-0-0-2020-07-28) |
| [Python](https://docs.python.org/3.13/using/cmdline.html#using-on-controlling-color) | Python REPL, tracebacks and `doctest` output | [2024-05-08 / 3.13.0b1](https://docs.python.org/3.13/whatsnew/3.13.html) |
| [pytocron](https://github.com/hartwork/pytocron) | Container cron | [2025-05-05 / 1.2.0](https://github.com/hartwork/pytocron/releases/tag/v1.2.0) |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Line-oriented search tool | [2020-01-11 / 12.0.0](https://github.com/BurntSushi/ripgrep/commit/5a6e17fcc133f70f922a123483d0d5a158c041b0) |
| [rsmodules](https://github.com/fretn/rsmodules) | Manage one's environment by the use of modulefiles | [2018-10-09 / 0.7.3](https://github.com/fretn/rsmodules/commit/87a45f96a9bd45b86300a6027bb29855778d4f5e) |
| [rsyncy](https://github.com/laktak/rsyncy) | Status/progress bar for rsync | [2023-06-30 / 0.2.0](https://github.com/laktak/rsyncy/commit/8baf2771b7b3a4cbd2d8ea11931f1eb859ec0473) |
| [Ruff](https://github.com/charliermarsh/ruff) | Python linter written in Rust | [2023-08-09](https://github.com/charliermarsh/ruff/commit/0d8e4bd6e9580a2484fa68c45cb3569e0815ac3f) |
| [SaC](https://sac-home.org/) | Functional array programming language with C like syntax | [2025-11-19](https://gitlab.sac-home.org/sac-group/sac2c/-/commit/5478e5dd9939c44855b01e5875878c6d9416964f) |
| [Scipion](http://scipion.i2pc.es) | CryoEM and CryoET image processing workflow engine | [2022-07-07 / 3.0.22](https://github.com/scipion-em/scipion-pyworkflow/tree/v3.0.22) |
| [ShellSpec](https://shellspec.info/) | Full-featured BDD unit testing framework for shell scripts | [2020-06-21 / 0.25.0](https://github.com/shellspec/shellspec/releases/tag/0.25.0) |
| [shuffle](https://github.com/hyperjeff/shuffle) | Command line music player | [2022-02-03 / 1.9.1](https://github.com/hyperjeff/homebrew-tools/releases/tag/v1.9.1) |
| [sjasmplus](https://github.com/z00m128/sjasmplus) | Z80/Z80N/GameBoy cross-assembler | [2022-06-14 / 1.20.0](https://github.com/z00m128/sjasmplus/releases/tag/v1.20.0) |
| [smenu](https://github.com/p-gen/smenu) | Terminal selection filter | [2018-02-05 / 1.0.0](https://github.com/p-gen/smenu/commit/70d3ee5a328230dff3b744b2f0ca7ef20ecb530e) |
| [Snow](https://github.com/mortie/snow) | Testing library for C | [2018-01-24 / 2.3.2](https://github.com/mortie/snow/commit/aadbbd375e03ec6000e23d817d2bd722b417296f) |
| [soupault](https://soupault.app) | Static website generator based on HTML rewriting | [2021-07-19 / 3.0.0](https://soupault.app/blog/soupault-3.0.0-release/) |
| [Sphinx](https://sphinx-doc.org/) | The Sphinx documentation generator | [2022-03-28 / 4.5.0](https://www.sphinx-doc.org/en/master/changes.html#release-4-5-0-released-mar-28-2022) |
| [sqlfluff](https://sqlfluff.com/) | The SQL Linter for humans | [2025-07-11 / 3.4.2](https://github.com/sqlfluff/sqlfluff/releases/tag/3.4.2) |
| [sqlfmt](https://sqlfmt.com) | Autoformatter for dbt SQL | [2021-11-05 / 0.1.0](https://docs.sqlfmt.com/getting-started/configuring-sqlfmt#no-color-and-force-color) |
| [Symfony](https://github.com/symfony/symfony) | PHP framework and reusable components | [2019-11-21 / 4.4.0](https://symfony.com/releases/4.4) |
| [taoup](http://github.com/globalcitizen/taoup) | Fortune implementation | [2018-09-10 / 1.19](https://github.com/globalcitizen/taoup/commit/fb2dc7768a2dc9b74816ce5126e40b93338291f7) |
| [Tarantool](https://www.tarantool.io/) | In-memory computing platform | [2021-10-19](https://github.com/tarantool/tarantool/commit/1163aa056398e21fbbedc25bcc9aa858fad9cdff) |
| [TaskLite](https://tasklite.org/) | CLI task manager | [2025-07-26 / 0.5](https://github.com/ad-si/TaskLite/releases/tag/v0.5.0.0) |
| [TeaISO](https://gitlab.com/tearch-linux/applications-and-tools/teaiso) | Live ISO generation tools | [2021-10-22](https://gitlab.com/tearch-linux/applications-and-tools/teaiso/-/commit/151c61c299bd71adc1987ef73ad588cfbe88d244) |
| [tealdeer](http://github.com/dbrgn/tealdeer) | TLDR pages client | [2020-09-03 / 1.4.0](https://github.com/dbrgn/tealdeer/releases/tag/v1.4.0) |
| [Telescope](https://telescope.omarpolo.com) | Gemini browser | [2021-06-27 / 0.3](https://github.com/omar-polo/telescope/releases/tag/0.3) |
| [tio](https://github.com/tio/tio) | A simple serial device I/O tool | [2024-03-06](https://github.com/tio/tio/commit/ed4ac0c797cd25b0b5d31a7654349e928b3eac58) |
| [tree](https://oldmanprogrammer.net/source.php?dir=projects/tree) | Recursive directory listing command | [2022-12-26 / 2.1.0](https://gitlab.com/OldManProgrammer/unix-tree/-/blob/22a2e268206b8d2238a686458c4702f9b3689e5b/CHANGES) |
| [Tree-Sitter](https://tree-sitter.github.io) | A parser generator tool and an incremental parsing library | [2024-05-05 / 0.22.6](https://github.com/tree-sitter/tree-sitter/releases/tag/v0.22.6) |
| [TreeViewer](https://treeviewer.org) | Phylogenetic tree visualisation software | [2021-02-19 / 1.0.0](https://github.com/arklumpus/TreeViewer/releases/tag/v1.0.0) |
| [Trunk Recorder](https://trunkrecorder.com) | Radio recorder for P25, SmartNet, and conventional systems | [2023-12-02 / 4.7.0](https://github.com/robotastic/trunk-recorder/releases/tag/v4.7.0) |
| [tsfm](https://npmjs.com/package/tsfm) | Light TUI file manager | [2023-07-19 / 2.4.0](https://github.com/akpi816218/tsfm/releases/tag/v2.4.0) |
| [twa](https://github.com/trailofbits/twa) | Tiny web auditor with strong opinions | [2018-11-15 / 1.1.0](https://github.com/trailofbits/twa/releases/tag/1.1.0) |
| [txtnish](https://github.com/mdom/txtnish) | Twtxt microblogging client | [2018-08-31](https://github.com/mdom/txtnish/commit/257d312ac282ab99e8357e31f6c282b881fbb171) |
| [ugrep](https://ugrep.com) | File pattern searcher | [2024-04-03 / 5.1.2](https://github.com/Genivia/ugrep/releases/tag/v5.1.2) |
| [undertime](https://gitlab.com/anarcat/undertime) | Timezone coordination tool | [2018-06-06](https://gitlab.com/anarcat/undertime/commit/0c4c2b38f32127a0dc59d2bd6e5f9db0b61ca847) |
| [UnrealIRCd](https://www.unrealircd.org) | IRC Server | [2023-03-11](https://github.com/unrealircd/unrealircd/commit/c43753cd4b36ed2662b0df2b2f91887a25b3283e) |
| [UPX](https://upx.github.io) | The Ultimate Packer for eXecutables | [2023-10-26 / 4.2.0](https://github.com/upx/upx/releases/tag/v4.2.0) |
| [whence](https://github.com/ppelleti/whence) | Print URL a file was downloaded from | [2020-06-20 / 0.9.2](https://github.com/ppelleti/whence/releases/tag/0.9.2) |
| [woob](https://woob.tech) | Command-line applications to interact with many websites | [2021-05-13 / 3.1](https://gitlab.com/woob/woob/-/commit/f6b446ba5af7bd80f2795330facc9841740c7076) |
| [xh](https://github.com/ducaale/xh) | Friendly and fast tool for sending HTTP requests | [2021-02-28 / 0.8.0](https://github.com/ducaale/xh/releases/tag/v0.8.0) |
| [xidoc](https://xidoc.nim.town/) | Consistent and powerful markup language | [2023-01-09 / 2023.1.9](https://git.sr.ht/~xigoi/xidoc/refs/2023.1.9) |
| [xplr](https://github.com/sayanarijit/xplr) | File manager | [2021-04-15 / 0.4.4](https://github.com/sayanarijit/xplr/releases/tag/v0.4.4) |
| [yewtube](https://github.com/mps-youtube/yewtube) | Terminal YouTube client | [2023-04-22](https://github.com/mps-youtube/yewtube/commit/cd905ec5c5dabcb63b4c37a1a9e12cd74d360bb1) |
| [yt-dlp](https://github.com/yt-dlp/yt-dlp) | Video downloader | [2023-11-20](https://github.com/yt-dlp/yt-dlp/commit/a0b19d319a6ce8b7059318fa17a34b144fde1785) |
| [zf](https://github.com/natecraddock/zf) | Command-line fuzzy finder prioritizing matches on filenames | [2022-07-02 / 0.5](https://github.com/natecraddock/zf/blob/master/CHANGELOG.md#05) |
| [zig](https://github.com/ziglang/zig) | Zig compiler | [2021-12-20 / 0.9.0](https://ziglang.org/download/0.9.0/release-notes.html) |
| [zimfw](https://zimfw.sh) | Zsh plugin manager | [2024-11-25 / 1.16.0](https://github.com/zimfw/zimfw/releases/tag/v1.16.0) |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter cd command | [2020-03-05 / 0.1.0](https://github.com/ajeetdsouza/zoxide/releases/tag/v0.1.0) |
| [zypper](https://github.com/openSUSE/zypper) | openSUSE package manager | [2022-06-15 / 1.14.53](https://github.com/openSUSE/zypper/commit/7a03e8594bb8dbf2af68decc4427d5244f68f46c) |
{: rules="groups"}

## Disabling color in software not supporting `NO_COLOR` <a name="other"></a>

{:.two_col}
| Software | Method |
|:-|:-|
| [Ammonite](https://github.com/lihaoyi/Ammonite) | `amm --color false` ([Docs](https://ammonite.io/#1.0.0)) |
| [Arcanist](https://github.com/phacility/arcanist) | `arc --no-ansi COMMAND` ([Docs](http://manpages.ubuntu.com/manpages/xenial/man1/arc.1.html)) |
| [aria2](https://aria2.github.io/) | `aria2c --enable-color=false` ([Docs](https://aria2.github.io/manual/en/html/aria2c.html#cmdoption-enable-color)) |
| [Bundler](https://bundler.io/) | `bundle COMMAND --no-color` ([Docs](https://bundler.io/v1.15/man/bundle.1.html)) |
| [Chalk](https://github.com/chalk/chalk) | `export FORCE_COLOR=0` ([Docs](https://github.com/chalk/chalk#supportscolor)) |
| [CMake](https://cmake.org/) | Set `CMAKE_COLOR_DIAGNOSTICS` to `OFF` ([Docs](https://cmake.org/cmake/help/latest/variable/CMAKE_COLOR_DIAGNOSTICS.html)) |
| [Cocoapods](https://cocoapods.org/) | `pod COMMAND --no-ansi` ([Docs](https://guides.cocoapods.org/terminal/commands.html#pod_install)) |
| [FFmpeg](https://ffmpeg.org/) | `export AV_LOG_FORCE_NOCOLOR=true` ([Docs](https://ffmpeg.org/ffmpeg.html#toc-Generic-options)) |
| [GCC](https://gcc.gnu.org/) | `export GCC_COLORS=` or `-fno-diagnostics-color` ([Docs](https://gcc.gnu.org/onlinedocs/gcc-7.3.0/gcc/Diagnostic-Message-Formatting-Options.html)) |
| [Git](https://git-scm.com/) | `git config --global color.ui false` ([Docs](https://git-scm.com/docs/git-config#git-config-colorui)) |
| [GoAccess](https://goaccess.io/) | `goaccess --no-color` ([Docs](https://goaccess.io/man#options)) |
| [GStreamer](https://gstreamer.freedesktop.org/) | `export GST_DEBUG_NO_COLOR=true` or `--gst-debug-no-color` ([Docs](https://gstreamer.freedesktop.org/documentation/gstreamer/running.html)) |
| [luacheck](https://github.com/lunarmodules/luacheck) | `luacheck --no-color` ([Docs](https://luacheck.readthedocs.io/en/stable/cli.html)) |
| [Lynx](http://lynx.browser.org/) | `lynx -nocolor` (or `show_color=never` in `.lynxrc`) |
| [Mercurial](https://www.mercurial-scm.org/) | `hg --color=never` (or [Docs for .hgrc](https://www.mercurial-scm.org/wiki/ColorExtension)) |
| [Midnight Commander](https://midnight-commander.org/) | `mc --nocolor` |
| [Packer](https://www.packer.io/) | `export PACKER_NO_COLOR=true` |
| [pre-commit](https://pre-commit.com/) | `pre-commit --color=never` or `export PRE_COMMIT_COLOR=never` ([Docs](https://pre-commit.com/#command-line-interface), [Rejected `NO_COLOR` Request](https://github.com/pre-commit/pre-commit/issues/1073#issuecomment-514247757)) |
| [Puppet](https://www.puppet.com/) | `puppet agent --color false`  ([Docs](https://www.puppet.com/docs/puppet/8/configuration#color)) |
| [Radare](https://www.radare.org/r/) | `radare2 -e scr.color=0` |
| [RSpec](http://rspec.info/) | `export SPEC_OPTS=--no-color` |
| [Ruby (tests)](https://www.ruby-lang.org/) | `export RUBY_TESTOPTS=--color=never` |
| [The Silver Searcher](https://geoff.greer.fm/ag/) | `ag --nocolor` ([Rejected `NO_COLOR` Request](https://github.com/ggreer/the_silver_searcher/pull/1207)) |
| [Thor](http://whatisthor.com/) | `export THOR_SHELL=Basic` ([Docs](http://www.rubydoc.info/github/wycats/thor/Thor%2FBase.shell)) |
| [util-linux](https://github.com/karelzak/util-linux) | `touch /etc/terminal-colors.d/disable` ([Docs](http://man7.org/linux/man-pages/man5/terminal-colors.d.5.html)) |
| [Vim](http://www.vim.org/) | `vim '+set t_Co=0'` |
| [zellij](https://zellij.dev/) | `zellij --no-formatting` ([GitHub Issue #3057](https://github.com/zellij-org/zellij/issues/3057)) |
{: rules="groups"}
