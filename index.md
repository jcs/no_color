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
| ... | ... |
{: rules="groups"}

## Disabling color in software not supporting `NO_COLOR`

| Software | Method |
|:-|:-|
| [clang](https://clang.llvm.org/) | [`-fno-color-diagnostics`](https://clang.llvm.org/docs/UsersManual.html#formatting-of-diagnostics) |
{: rules="groups"}

## Software with no mechanism to disable color

| Software | Notes |
|:-|:-|
| [Homebrew](https://brew.sh/) | Could probably be disabled by having [`Tty` module](https://github.com/Homebrew/brew/blob/master/Library/Homebrew/utils/tty.rb) look for `ENV["NO_COLOR"]` |
{: rules="groups"}
