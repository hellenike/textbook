# *Hellênikê*: online textbook


The `docs` directory of this repository hosts the source for the web site at <https://hellenike.github.io/textbook/>.


- The content is written in [markdown](https://www.markdownguide.org/cheat-sheet/).
- The site is served by [github's pages](https://pages.github.com) service.
- The site is configured to use the "[Just-the-docs](https://pmarsceill.github.io/just-the-docs/)"  theme for jekyll.


And of course the repository depends on [git](https://guides.github.com/activities/hello-world/) for version control.


## Running the website locally

See [the project wiki](https://github.com/hellenike/textbook/wiki/running-a-local-version).

## Generating a PDF

If you have julia,you can use the `composite.jl` script to generate a composite markdown file like this:

    julia composite.jl

You can then use pandoc to generate a PDF.

### Configuring options for pandoc

- include optional argument with a YAML settings file


## Prequisites


-  [pandoc](https://pandoc.org)
- a LaTex engine 
- the Eisvogel LaTex template, 



### Building the PDF

Example invocation of `pandoc`:

    pandoc composite.md  --from markdown --template eisvogel --pdf-engine=tectonic --table-of-contents --number-sections -o pdf/hellenike.pdf  --top-level-division=chapter

