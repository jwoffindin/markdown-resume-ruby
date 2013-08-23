# Ruby Markdown Resume Generator

Turn a simple Markdown document into an elegant resume with both a perfect
pdf printable format, and a responsive css3 html5 file. 

An Ruby adaption of Craig Davis's php-based project [Markdown Resume Generator][mrg], which
was described in his [blog post for the project][blog]. Most of this
README was lifted directly, appologies Craig :-)

It's a bit rough around the edges still, I got it to the point where it
generated my CV in a format that I was happy with.

## Features

* Three styles to choose from: modern, blockish, unstyled
* PDF generation via `wkhtmltopdf`
* Responsive design for multiple device viewport sizes
* Simple Markdown formatting
* Single file deployment
* You can now version control and branch your resume.

## Quickstart

Assuming you've a recent ruby / bundler insall, you should be able to
get going with:

```bash
bundle
./generate -h
```

for example:

```bash
./generate -T modern -f my-cv.pdf -p
```

## Options

Choose a template/theme with the -T option.

## Development

Markdown is limited to basic html markup. Follow the `resume/sample.md` file 
as a guideline. This file includes various headers and several nested elements.
This allows us to construct a semantic HTML document for the resume, and then
use a CSS rules to display a very nice resume. Note that because we have very
few ways to nest or identify elements that many of the css rules are based
on descendant and adjacent selectors. 

## TODO

* Fix broken rspecs
* Fix `wkhtmltopdf` path
* Buy Craig a beer

## Acknowledgments

As above, Craig Davis for his project.

> The initial inspiration is from the [Sample Resume Template][srt].
> However, no HTML from that project has been used in this. General layout has been reused, and media queries
> have been added. It's a nice template, and if you are a more comfortable with html than markdown, you should use it.

[srt]: http://sampleresumetemplate.net/ "A great starting point"
[blog]: http://there4development.com/blog/2012/12/31/markdown-resume-builder/
[php-mrg]: http://github.com/there4/markdown-resume

