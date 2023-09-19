# `NO_COLOR`

For information on the `NO_COLOR` standard, see
[no-color.org](http://no-color.org).

## Adding software

To add or update software on the `no-color.org` website, clone this Git
repository and update `index.md` with a line under the appropriate section,
keeping entries in alphabetical order.
The line must be formatted as:

``` markdown
| [Software Name](URL) | Short description | [YYYY-MM-DD / X.X.X](URL) |
```

For the third field, the date and version number should be those of the first
release of the software available with `NO_COLOR` support, with a link to the
release notes for that version.

If a version is not available, just include a date and link to the commit when
`NO_COLOR` support was added.

Make the description as short as possible, avoiding superfluous adjectives like
"the best ..." or "an all-new ...".

Once your entry is complete, commit your changes, push to your cloned repo, and
then submit a pull request to this repository.
If you do not have a GitHub account, e-mail your diff to
[jcs@jcs.org](mailto:jcs@jcs.org).
Once your change is merged, the `no-color.org` website will be automatically
rebuilt within a few minutes.

## Testing changes

If you are making extensive changes to the output and want to verify them in a
browser before committing, you can setup a Jekyll environment with:

``` console
$ bundle install
$ bundle exec jekyll serve
```

And then visit
[http://127.0.0.1:4000/](http://127.0.0.1:4000/).
