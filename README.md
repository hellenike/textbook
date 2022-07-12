# *Hellênikê*: online textbook


The `docs` directory of this repository hosts the source for the web site at <https://hellenike.github.io/textbook/>.


- The content is written in [markdown](https://www.markdownguide.org/cheat-sheet/).
- The site is served by [github's pages](https://pages.github.com) service.
- The site is configured to use the "[Just-the-docs](https://pmarsceill.github.io/just-the-docs/)"  theme for jekyll.


And of course the repository depends on [git](https://guides.github.com/activities/hello-world/) for version control.


## Running the website locally

See [the project wiki](https://github.com/hellenike/textbook/wiki/running-a-local-version).

## Generating a PDF

If you have all the prerequisites in place, you can build a PDF with `sh makepdf.sh`.

The shell script works by first creating a single composite markdown file from the all the website documents, then using pandoc to generate a pdf.

The prerequisites are:

- julia
- pandoc
- tectonic
- the Eisvogel LaTex template


You can also separately create a composite and generate a pdf if you want to customize the result.

### Generating a composite markdown file

Requirements: julia

Use the `composite.jl` script to generate a composite markdown file like this:

    julia composite.jl

If you want to include optional settings for pandoc to use when building the PDF, you include an additional optional parameter naming a YAML settings file, like this:

    julia composite.jl pdf/settings.yaml

See the `pdf/settings.yaml` for an example.


### Using pandoc to generate a PDF from the composite

Requirements: pandoc, tectonic (or another LaTex engine you configure), the Eisvogel (or another LaTex template you configure)

Example invocation of `pandoc`:

    pandoc composite.md  --from markdown --template eisvogel --pdf-engine=tectonic --table-of-contents --number-sections --top-level-division=chapter -o pdf/hellenike.pdf  

