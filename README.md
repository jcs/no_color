# `NO_COLOR`

For information on the `NO_COLOR` standard, see
[no-color.org](http://no-color.org).

## Adding software

To add or update software on the `no-color.org` website, clone this Git
repository and update `index.md` with a line under the appropriate section,
keeping entries in alphabetical order.
The line should be formatted as:

     | [Software Name](URL) | Short description | [X.Y.Z or YYYY-MM-DD](URL) |

A version number of the first release available with `NO_COLOR` support is
preferred, with a link to the release notes for that version.
Otherwise, a date of the commit when `NO_COLOR` support was added can be used
with the link pointing to the commit.

Commit your changes, push to your cloned repo, and then submit a pull request
to this repository.
If your change is merged, the `no-color.org` website will be automatically
rebuilt.

## Testing changes

If you are making extensive changes to the output and want to verify them in a
browser before committing, you can setup a Jekyll environment with:

	no_color$ bundle install
	no_color$ bundle exec jekyll serve

And then visit
[http://127.0.0.1:4000/](http://127.0.0.1:4000/).
